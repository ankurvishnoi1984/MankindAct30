
const db = require("../config/db")
const logger = require('../utils/logger')


exports.login = async (req, res) => {
  console.log("login function triggered")
  const { empcode, password } = req.body;
  console.log(empcode, password)
  const query = 'select user_id, empcode, password, role,designation from user_mst where empcode=? and password = ? and status = "Y"';

  try {
    db.query(query, [empcode,password], (err, result) => {
      if (err) {
        logger.error(`Error in /controller/auth/login: ${err.message}. SQL query: ${query}`);
        return res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred"
        });
      } else if (result.length === 0) {
        console.log("res len err")
        return res.status(401).json({
          errorCode: "0",
          errorDetail: "Invalid Email or Password",
          responseData: {},
          status: "ERROR",
          details: "UNAUTHORIZED",
          getMessageInfo: "Invalid Email or Password"
        });
      } else {
        
        const user = result[0];
        if (password == user.password) {
          const loginTime = new Date();
          const historyQuery = 'insert into user_login_history (user_id, login_datetime) values (?, ?)';
          db.query(historyQuery, [user.user_id, loginTime], (err, result) => {
            if (err) {
              
              logger.error(`Error in /controller/auth/login: ${err.message}. SQL query: ${query}`);
              return res.status(500).json({
                errorCode: "0",
                errorDetail: err.message,
                responseData: {},
                status: "ERROR",
                details: "An internal server error occurred",
                getMessageInfo: "An internal server error occurred"
              });
            } else {
             
              const historyId = result.insertId;
              console.log(result)
              return res.json({
                errorCode: "1",
                errorDetail: "",
                responseData: {
                  message: "Login successful",
                  empID: user.empcode,
                  user_id: user.user_id,
                  role: user.role,
                  designation:user.designation,
                  sessionID:historyId
                },
                status: "SUCCESS",
                details: "",
                getMessageInfo: ""
              });
            }
          });
        } else {
          return res.status(401).json({
            errorCode: "UNAUTHORIZED",
            errorDetail: "Invalid Email or Password",
            responseData: {},
            status: "ERROR",
            details: "Invalid Email or Password",
            getMessageInfo: "Invalid Email or Password"
          });
        }
      }
    });
  } catch (error) {
    logger.error(`Error in /controller/auth/login: ${error.message}. SQL query: ${query}`);
    return res.status(500).json({
      errorCode: "0",
      errorDetail: error.message,
      responseData: {},
      status: "ERROR",
      details: "An internal server error occurred",
      getMessageInfo: "An internal server error occurred"
    });
  }
};


exports.logout = async (req, res) => {
  const {sessionId } = req.body;
  const logoutTime = new Date();
  const query = 'update user_login_history set logout_datetime =? where lh_id = ?'
  try {
    db.query(query, [logoutTime,sessionId], (err, result) => {
      if (err) {
        logger.error(`Error in /controller/auth/logout: ${err.message}. SQL query: ${query}`);
        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred"
        });
      }
      else{
        res.status(200).json({ message: "Logout Successfully",errorCode: "1"})
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/auth/logout: ${error.message}. SQL query: ${query}`); 
    res.send(error)
  }
};

// exports.getAppVersion = async (req, res) => {
 
// const query = 'select version from app_version_mst'

//   try {
//     db.query(query,(err, result) => {
//       if (err) {
//          logger.error(`Error in /controller/auth/getAppVersion: ${err.message}. SQL query: ${query}`);
//         res.status(500).json({
//           errorCode: "0",
//           errorDetail: err.message,
//           responseData: {},
//           status: "ERROR",
//           details: "An internal server error occurred",
//           getMessageInfo: "An internal server error occurred"
//         });
//       }
//       else{
//         res.status(200).json(result)
//       } 
//     });
//   } catch (error) {
//     logger.error(`Error in /controller/auth/getAppVersion: ${error.message}. SQL query: ${query}`);
//     res.send(error)
//   }
// };



exports.getAppVersion = async (req, res) => {
  const query = 'SELECT version FROM app_version_mst';
  const playStoreUrl = 'https://play.google.com/store/apps'; // Add your actual Play Store URL here

  try {
    db.query(query, (err, result) => {
      if (err) {
        logger.error(`Error in /controller/auth/getAppVersion: ${err.message}. SQL query: ${query}`);
        return res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      }

      // Assume latest version is the first result
      const response = [
        {
          version: result[0]?.version || "1.0.0", // fallback version
          playStoreUrl: playStoreUrl,
        },
      ];

      res.status(200).json(response);
    });
  } catch (error) {
    logger.error(`Error in /controller/auth/getAppVersion: ${error.message}. SQL query: ${query}`);
    res.status(500).json({
      errorCode: "0",
      errorDetail: error.message,
      responseData: {},
      status: "ERROR",
      details: "An internal server error occurred",
      getMessageInfo: "An internal server error occurred",
    });
  }
};



