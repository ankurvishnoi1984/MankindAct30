const db = require("../config/db");
const logger = require("../utils/logger");
const moment = require('moment');

exports.AdminLogin = async (req, res) => {
  console.log("inside admin login")
  const { username, password } = req.body;
  const query = "select username,password from admin_login_mst Where status = 'Y'";

  try {
    db.query(query, (err, result) => {
      if (err) {
        logger.error(err.message);
        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else if (result.length === 0) {
        logger.warn("Invalid Email or Password");
        res.status(401).json({
          errorCode: "0",
          errorDetail: "Invalid Email or Password",
          responseData: {},
          status: "ERROR",
          details: "UNAUTHORIZED",
          getMessageInfo: "Invalid Email or Password",
        });
      } else {
        const user = result[0];
        if (username === user.username && password === user.password) {
          logger.info(" Admin Login successful");
          res.json({
            errorCode: "1",
            errorDetail: "",
            responseData: {
              message: "Login successful",
            },
            status: "SUCCESS",
            details: "",
            getMessageInfo: "",
          });
        } else {
          logger.warn("Invalid Email or Password");
          res.status(401).json({
            errorCode: "UNAUTHORIZED",
            errorDetail: "Invalid Email or Password",
            responseData: {},
            status: "ERROR",
            details: "Invalid Email or Password",
            getMessageInfo: "Invalid Email or Password",
          });
        }
      }
    });
  } catch (error) {
    logger.error(error.message);
    res.send(error);
  }
};

exports.totalDoctor = async (req, res) => {
  // const query = "SELECT COUNT(*) as doctor_count FROM doctor_mst";
  const query = 'select count(distinct doctor_name) as doctor_count from camp_report_mst where status = "Y"';

  try {
    db.query(query, (err, result) => {
      if (err) {
        logger.error(err.message);
        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        logger.info("Fetched total doctors");
        res.status(200).json(result[0]);
      }
    });
  } catch (error) {
    logger.error(error.message);
    res.json(error);
  }
};

exports.totalCamps = async (req, res) => {
  // const query = "SELECT COUNT(*) as camp_count FROM doctor_camp_mapping;";
  const query = 'select count(*) as camp_count from camp_report_mst where status = "Y"';
  try {
    db.query(query, (err, result) => {
      if (err) {
        logger.error(err.message);

        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        logger.info("Fetched total Camps");

        res.status(200).json(result[0]);
      }
    });
  } catch (error) {
    logger.error(error.message);

    res.json(error);
  }
};

exports.totalPaScreened = async (req, res) => {
  const query =
    "SELECT SUM(answer) as screened_count FROM question_camp_rep_mapping WHERE rqid IN (1, 4, 7, 10, 13) and status = 'Y'";

  try {
    db.query(query, (err, result) => {
      if (err) {
        logger.error(err.message);

        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        logger.info("Fetched total patient screened");

        res.status(200).json(result[0]);
      }
    });
  } catch (error) {
    logger.error(error.message);

    res.json(error);
  }
};

exports.totalPaDiagnosed = async (req, res) => {
  const query =
    "SELECT SUM(answer) as diagnosed_count FROM question_camp_rep_mapping WHERE rqid IN (2, 5, 8, 11, 14, 15) and status = 'Y'";

  try {
    db.query(query, (err, result) => {
      if (err) {
        logger.error(err.message);

        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        logger.info("Fetched total patients diagnosed");

        res.status(200).json(result[0]);
      }
    });
  } catch (error) {
    logger.error(error.message);

    res.json(error);
  }
};



exports.getSubCatData = async (req, res) => {
  //const { subCatId, rqId1,rqId2 } = req.body;
  try {
    const query1 = `SELECT
      subcat_id,
      MAX(CASE WHEN rn = 1 THEN rqid END) AS rqid1,
      MAX(CASE WHEN rn = 2 THEN rqid END) AS rqid2,
      MAX(CASE WHEN rn = 3 THEN rqid END) AS rqid3,
      MAX(CASE WHEN rn = 4 THEN rqid END) AS rqid4
  FROM (
      SELECT
          subcat_id,
          rqid,
          ROW_NUMBER() OVER (PARTITION BY subcat_id ORDER BY rqid) AS rn
      FROM report_ques_mst
      WHERE status = 'Y'
  ) AS subcat_rn
  GROUP BY subcat_id;
  `;
    const users = await new Promise((resolve, reject) => {
      db.query(query1, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });

    const reportData = [];
    console.log(users);
    for (const user of users) {
      const query2 = "CALL GetSubCatData(?)";
      try {
        const result = await new Promise((resolve, reject) => {
          db.query(
            query2,
            [user.subcat_id],
            (err, result) => {
              if (err) {
                logger.error(err.message);
                reject(err);
              } else {
                resolve(result);
              }
            }
          );
        });
        reportData.push(result[0][0]);
      } catch (error) {
        logger.error(error.message);
        // Handle the error here, but don't send a response in the loop.
      }
    }

    logger.info("Subcategory Data Fetch Successfully");
    res.status(200).json(reportData);
  } catch (error) {
    logger.error(error.message);
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

exports.getSubCatFiterData = async (req, res) => {
  const { filter, startDate, endDate } = req.query;
  try {
    const query1 = `SELECT
      subcat_id,
      MAX(CASE WHEN rn = 1 THEN rqid END) AS rqid1,
      MAX(CASE WHEN rn = 2 THEN rqid END) AS rqid2,
      MAX(CASE WHEN rn = 3 THEN rqid END) AS rqid3,
      MAX(CASE WHEN rn = 4 THEN rqid END) AS rqid4
  FROM (
      SELECT
          subcat_id,
          rqid,
          ROW_NUMBER() OVER (PARTITION BY subcat_id ORDER BY rqid) AS rn
      FROM report_ques_mst
      WHERE status = 'Y'
  ) AS subcat_rn
  GROUP BY subcat_id;
  `;
    const users = await new Promise((resolve, reject) => {
      db.query(query1, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });

    const reportData = [];
    console.log(users);
    for (const user of users) {
      const query2 = "CALL GetFilteredReportData1(?,?,?,?)";
      try {
        const result = await new Promise((resolve, reject) => {
          db.query(
            query2,
            [user.subcat_id,filter,startDate,endDate],
            (err, result) => {
              if (err) {
                logger.error(err.message);
                reject(err);
              } else {
                resolve(result);
              }
            }
          );
        });
        console.log(result)
        reportData.push(result[0][0]);
      } catch (error) {
        logger.error(error.message);
        // Handle the error here, but don't send a response in the loop.
      }
    }

    logger.info("Subcategory Filter Data Fetch Successfully");
    res.status(200).json(reportData);
  } catch (error) {
    logger.error(error.message);
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

exports.subCatInfo = async (req, res) => {
  const query = `SELECT
  subcat_rn.subcat_id,
  subcat_name.subcategory_name,
  MAX(CASE WHEN rn = 1 THEN rqid END) AS rqid1,
  MAX(CASE WHEN rn = 2 THEN rqid END) AS rqid2,
  MAX(CASE WHEN rn = 3 THEN rqid END) AS rqid3,
  MAX(CASE WHEN rn = 4 THEN rqid END) AS rqid4
FROM (
  SELECT
      subcat_id,
      rqid,
      ROW_NUMBER() OVER (PARTITION BY subcat_id ORDER BY rqid) AS rn
  FROM report_ques_mst
  WHERE status = 'Y'
) AS subcat_rn
JOIN subcategory_mst AS subcat_name
  ON subcat_rn.subcat_id = subcat_name.subcategory_id
GROUP BY subcat_rn.subcat_id, subcat_name.subcategory_name;`;

  try {
    db.query(query, (err, result) => {
      if (err) {
        logger.error(err.message);

        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        

        res.status(200).json(result);
      }
    });
  } catch (error) {
    logger.error(error.message);

    res.json(error);
  }
};

// api for employee

exports.addEmployee = async (req, res) => {
  const { name, empcode, state, hq, pincode, reporting, password, role } =
    req.body;
    
    console.log(req.body)
  const query =
    "insert into user_mst(name,empcode,state,hq,pincode,reporting,password,role) values(?,?,?,?,?,?,?,?)";
  try {
    db.query(
      query,
      [name, empcode, state, hq, pincode, reporting, password, role],
      (err, result) => {
        if (err) {
          logger.error(err.message);
          res.status(500).json({
            errorCode: "0",
            errorDetail: err.message,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred",
          });
        } else {
          logger.info("Employee Added Successfully");

          res
            .status(200)
            .json({ message: "Employee Added Successfully", errorCode: "1" });
        }
      }
    );
  } catch (error) {
    logger.error(error.message);

    res.send(error);
  }
};

// api for report

// exports.getReport = async(req,res)=>{

//   //const {subCatId,rqId1,rqId2} = req.body;

//   const query = 'select user_id, name, empcode, role from user_mst'
//    try {
//          db.query(query, (err, result) => {
//            if (err) {
//            logger.error(err.message);
//              res.status(500).json({
//                errorCode: "0",
//                errorDetail: err.message,
//                responseData: {},
//                status: "ERROR",
//                details: "An internal server error occurred",
//                getMessageInfo: "An internal server error occurred"
//              });
//            }
//            else{
//              result.forEach(element => {

//               const query = 'CALL GetReportData(?,?,?)'
//               try {
//                     db.query(query, [element.user_id,1,2], (err, result) => {
//                       if (err) {
//                       logger.error(err.message);
//                         res.status(500).json({
//                           errorCode: "0",
//                           errorDetail: err.message,
//                           responseData: {},
//                           status: "ERROR",
//                           details: "An internal server error occurred",
//                           getMessageInfo: "An internal server error occurred"
//                         });
//                       }
//                       else{

//                         logger.info('Employee Report get Successfully');

//                         res.status(200).json(result)
//                       }
//                     });
//                   } catch (error) {
//                     logger.error(error.message);

//                     res.send(error)
//                   }

//              });
//            }
//          });
//        } catch (error) {
//          logger.error(error.message);

//          res.send(error)
//        }
// }

// exports.getReport = async (req, res) => {
//   const { subCatId, rqId1, rqId2, empcode } = req.query;
//     const page = parseInt(req.query.page) || 1;
//     const limit = parseInt(req.query.limit) || 20;
//     const offset = (page - 1) * limit;
  
//   try {
//     let query1;
//     if (empcode && empcode !== "null" && empcode !== undefined) {
//       query1 = `select user_id, name, empcode, role from user_mst where reporting=${empcode} LIMIT ${limit} OFFSET ${offset}`;
//     } else {
//       query1 = `select user_id, name, empcode, role from user_mst LIMIT ${limit} OFFSET ${offset}`;
//     }
//     //const query1 = 'select user_id, name, empcode, role from user_mst';
//     console.log(query1)
//     const users = await new Promise((resolve, reject) => {
//       db.query(query1, (err, result) => {
//         if (err) {
//           logger.error(err.message);
//           reject(err);
//         } else {
//           resolve(result);
//         }
//       });
//     });
   
//     const reportData = [];
//     for (const user of users) {
//       const query2 = "CALL GetReportData1(?,?,?,?)";
//       try {
//         const result = await new Promise((resolve, reject) => {
//           db.query(
//             query2,
//             [user.user_id, subCatId, rqId1, rqId2],
//             (err, result) => {
//               if (err) {
//                 logger.error(err.message);
//                 reject(err);
//               } else {
//                 resolve(result);
//               }
//             }
//           );
//         });
//         reportData.push(result[0][0]);
//       } catch (error) {
//         logger.error(error.message);
//         // Handle the error here, but don't send a response in the loop.
//       }
//     }

//     logger.info("Employee Report get Successfully");
//     res.status(200).json(reportData);
//   } catch (error) {
//     logger.error(error.message);
//     res.status(500).json({
//       errorCode: "0",
//       errorDetail: error.message,
//       responseData: {},
//       status: "ERROR",
//       details: "An internal server error occurred",
//       getMessageInfo: "An internal server error occurred",
//     });
//   }
// };

// this is working channel
exports.getReportNormal = async (req, res) => {
  const { subCatId, rqId1, rqId2, empcode } = req.query;
  const page = parseInt(req.query.page) || 1;
  const limit = parseInt(req.query.limit) || 20;
  const offset = (page - 1) * limit;
  const searchName = req.query.searchName || '';

  try {
    let query1;
    let totalRowCountQuery; // Query to count total matching rows

    if (empcode && empcode !== "null" && empcode !== undefined) {
      query1 = `select user_id, name, empcode, role from user_mst where reporting=${empcode} AND name LIKE '%${searchName}%' AND status = 'Y' LIMIT ${limit} OFFSET ${offset}`;
      totalRowCountQuery = `SELECT COUNT(*) as totalCount FROM user_mst WHERE reporting=${empcode} AND name LIKE '%${searchName}%' AND status = 'Y'`;
    } else {
      query1 = `select user_id, name, empcode, role from user_mst where name LIKE '%${searchName}%' AND status = 'Y' LIMIT ${limit} OFFSET ${offset}`;
      totalRowCountQuery = `SELECT COUNT(*) as totalCount FROM user_mst where name LIKE '%${searchName}%' AND status = 'Y'`;
    }

    const users = await new Promise((resolve, reject) => {
      db.query(query1, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });

    const totalRowCountResult = await new Promise((resolve, reject) => {
      db.query(totalRowCountQuery, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result[0]);
        }
      });
    });

    const totalRowCount = totalRowCountResult.totalCount;

    const reportData = [];
    for (const user of users) {
      const query2 = "CALL GetReportData1(?,?,?,?)";
      try {
        const result = await new Promise((resolve, reject) => {
          db.query(
            query2,
            [user.user_id, subCatId, rqId1, rqId2],
            (err, result) => {
              if (err) {
                logger.error(err.message);
                reject(err);
              } else {
                resolve(result);
              }
            }
          );
        });
        reportData.push(result[0][0]);
      } catch (error) {
        logger.error(error.message);
        // Handle the error here, but don't send a response in the loop.
      }
    }

    logger.info("Employee Report get Successfully");
    res.status(200).json({ reportData, totalRowCount }); // Send both data and total count
  } catch (error) {
    logger.error(error.message);
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



// exports.getReport = async (req, res) => {
//   const { subCatId, rqId1, rqId2, empcode,filter, startDate, endDate } = req.query;
//   const page = parseInt(req.query.page) || 1;
//   const limit = parseInt(req.query.limit) || 20;
//   const offset = (page - 1) * limit;
//   const searchName = req.query.searchName || '';

//   try {
//     let query1;
//     let totalRowCountQuery; // Query to count total matching rows

//     if (empcode && empcode !== "null" && empcode !== undefined) {
//       query1 = `select user_id, name, empcode, role from user_mst where reporting=${empcode} AND name LIKE '%${searchName}%' AND status = 'Y' LIMIT ${limit} OFFSET ${offset}`;
//       totalRowCountQuery = `SELECT COUNT(*) as totalCount FROM user_mst WHERE reporting=${empcode} AND name LIKE '%${searchName}%' AND status = 'Y'`;
//     } else {
//       query1 = `select user_id, name, empcode, role from user_mst where name LIKE '%${searchName}%' AND status = 'Y' LIMIT ${limit} OFFSET ${offset}`;
//       totalRowCountQuery = `SELECT COUNT(*) as totalCount FROM user_mst where name LIKE '%${searchName}% AND status = 'Y'`;
//     }

//     const users = await new Promise((resolve, reject) => {
//       db.query(query1, (err, result) => {
//         if (err) {
//           logger.error(err.message);
//           reject(err);
//         } else {
//           resolve(result);
//         }
//       });
//     });

//     const totalRowCountResult = await new Promise((resolve, reject) => {
//       db.query(totalRowCountQuery, (err, result) => {
//         if (err) {
//           logger.error(err.message);
//           reject(err);
//         } else {
//           resolve(result[0]);
//         }
//       });
//     });

//     const totalRowCount = totalRowCountResult.totalCount;

//     const reportData = [];
//     for (const user of users) {
//       const query2 = "CALL GetFilterReportData2(?,?,?,?,?,?,?)";
//       try {
//         const result = await new Promise((resolve, reject) => {
//           db.query(
//             query2,
//             [user.user_id, subCatId, rqId1, rqId2,filter,startDate,endDate],
//             (err, result) => {
//               if (err) {
//                 logger.error(err.message);
//                 reject(err);
//               } else {
//                 resolve(result);
//               }
//             }
//           );
//         });
//         console.log(result)
//         reportData.push(result[0][0]);
//       } catch (error) {
//         logger.error(error.message);
//         // Handle the error here, but don't send a response in the loop.
//       }
//     }

//     logger.info("Employee Report get Successfully");
//     res.status(200).json({ reportData, totalRowCount }); // Send both data and total count
//   } catch (error) {
//     logger.error(error.message);
//     res.status(500).json({
//       errorCode: "0",
//       errorDetail: error.message,
//       responseData: {},
//       status: "ERROR",
//       details: "An internal server error occurred",
//       getMessageInfo: "An internal server error occurred",
//     });
//   }
// };


exports.getReport = async (req, res) => {
  const {
    subCatId,
    rqId1,
    rqId2,
    empcode,
    filter,
    startDate,
    endDate,
    searchName = "",
    page = 1,
    limit = 20
  } = req.query;

  const offset = (parseInt(page) - 1) * parseInt(limit);
  const searchPattern = `%${searchName}%`;

  try {
    let query1 = "";
    let queryParams1 = [];
    let totalRowCountQuery = "";
    let totalParams = [];

    if (empcode && empcode !== "null") {
      query1 = `
        SELECT user_id, name, empcode, role
        FROM user_mst
        WHERE reporting = ? AND name LIKE ? AND status = 'Y'
        LIMIT ? OFFSET ?`;
      queryParams1 = [empcode, searchPattern, parseInt(limit), offset];

      totalRowCountQuery = `
        SELECT COUNT(*) as totalCount
        FROM user_mst
        WHERE reporting = ? AND name LIKE ? AND status = 'Y'`;
      totalParams = [empcode, searchPattern];
    } else {
      query1 = `
        SELECT user_id, name, empcode, role
        FROM user_mst
        WHERE name LIKE ? AND status = 'Y'
        LIMIT ? OFFSET ?`;
      queryParams1 = [searchPattern, parseInt(limit), offset];

      totalRowCountQuery = `
        SELECT COUNT(*) as totalCount
        FROM user_mst
        WHERE name LIKE ? AND status = 'Y'`;
      totalParams = [searchPattern];
    }

    const users = await new Promise((resolve, reject) => {
      db.query(query1, queryParams1, (err, result) => {
        if (err) return reject(err);
        resolve(result);
      });
    });

    const totalRowCountResult = await new Promise((resolve, reject) => {
      db.query(totalRowCountQuery, totalParams, (err, result) => {
        if (err) return reject(err);
        resolve(result[0]);
      });
    });

    const totalRowCount = totalRowCountResult.totalCount;

    const reportData = [];
    for (const user of users) {
      try {
        const result = await new Promise((resolve, reject) => {
          db.query(
            "CALL GetFilterReportData2(?, ?, ?, ?, ?, ?, ?)",
            [user.user_id, subCatId, rqId1, rqId2, filter, startDate, endDate],
            (err, result) => {
              if (err) return reject(err);
              resolve(result);
            }
          );
        });

        if (result && result[0] && result[0][0]) {
          reportData.push(result[0][0]);
        }
      } catch (error) {
        logger.error(`Stored procedure error for user ${user.user_id}: ${error.message}`);
        reportData.push({ user_id: user.user_id, error: "Error fetching report data" });
      }
    }

    logger.info("Employee report fetched successfully.");
    res.status(200).json({ reportData, totalRowCount });

  } catch (error) {
    logger.error(error.message);
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


// report download api 

exports.downloadReportNormal = async (req, res) => {
  const { subCatId, rqId1, rqId2, empcode } = req.query;
  const searchName = req.query.searchName || '';

  try {
    let query1;
   

    if (empcode && empcode !== "null" && empcode !== undefined) {
      
      // query1 = `select user_id, name, empcode, role from user_mst where reporting=${empcode} AND name LIKE '%${searchName}%'`;
    //   query1 = `WITH RECURSIVE EmployeeHierarchy AS (
    //     SELECT user_id,empcode, name, reporting
    //     FROM user_mst
    //     WHERE reporting = ${empcode} AND name LIKE '%${searchName}%'
    //     UNION ALL
    //     SELECT e.user_id, e.empcode, e.name, e.reporting
    //     FROM user_mst e
    //     INNER JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode
    // )
    // SELECT user_id, empcode, name
    // FROM EmployeeHierarchy
    // WHERE reporting IS NOT NULL;`

    query1=`
    WITH RECURSIVE EmployeeHierarchy AS (
      SELECT user_id, empcode, name, reporting
      FROM user_mst
      WHERE empcode = ${empcode} AND name LIKE '%${searchName}%' AND status = 'Y'
      UNION ALL
      SELECT e.user_id, e.empcode, e.name, e.reporting
      FROM user_mst e
      INNER JOIN EmployeeHierarchy eh ON e.empcode = eh.reporting
  )
  SELECT user_id, empcode, name
  FROM EmployeeHierarchy
  WHERE reporting IS NOT NULL
  
  UNION

SELECT user_id, empcode, name
FROM user_mst
WHERE reporting = ${empcode} AND name LIKE '%${searchName}%' AND status = 'Y';`
    } else {
      query1 = `select user_id, name, empcode, role from user_mst where name LIKE '%${searchName}%' AND status = 'Y'`;
     
    }

    const users = await new Promise((resolve, reject) => {
      db.query(query1, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });

    const reportData = [];
    for (const user of users) {
      const query2 = "CALL GetReportData1(?,?,?,?)";
      try {
        const result = await new Promise((resolve, reject) => {
          db.query(
            query2,
            [user.user_id, subCatId, rqId1, rqId2],
            (err, result) => {
              if (err) {
                logger.error(err.message);
                reject(err);
              } else {
                resolve(result);
              }
            }
          );
        });
        reportData.push(result[0][0]);
      } catch (error) {
        logger.error(error.message);
        // Handle the error here, but don't send a response in the loop.
      }
    }

    logger.info("Employee Report get Successfully");
    res.status(200).json(reportData); // Send both data and total count
  } catch (error) {
    logger.error(error.message);
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


//working code
exports.downloadReportFilter = async (req, res) => {
  const { subCatId, rqId1, rqId2, empcode,filter, startDate, endDate } = req.query;
  const searchName = req.query.searchName || '';

  try {
    let query1;
  

    if (empcode && empcode !== "null" && empcode !== undefined) {
      query1 = `select user_id, name, empcode, role from user_mst where reporting=${empcode} AND name LIKE '%${searchName}%' AND status = 'Y'`;
     
    } else {
      query1 = `select user_id, name, empcode, role from user_mst where name LIKE '%${searchName}%' AND status = 'Y'`;
     
    }

    const users = await new Promise((resolve, reject) => {
      db.query(query1, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });

    const reportData = [];
    for (const user of users) {
      const query2 = "CALL GetFilterReportData2(?,?,?,?,?,?,?)";
      try {
        const result = await new Promise((resolve, reject) => {
          db.query(
            query2,
            [user.user_id, subCatId, rqId1, rqId2,filter,startDate,endDate],
            (err, result) => {
              if (err) {
                logger.error(err.message);
                reject(err);
              } else {
                resolve(result);
              }
            }
          );
        });
        reportData.push(result[0][0]);
      } catch (error) {
        logger.error(error.message);
        // Handle the error here, but don't send a response in the loop.
      }
    }

    logger.info("Employee Report get Successfully");
    res.status(200).json(reportData); // Send both data and total count
  } catch (error) {
    logger.error(error.message);
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

// Hierarchy logic

  


exports.getTopLine = async (req, res) => {
  const { empcode } = req.body;

  const query =
    "select user_id,name,empcode,reporting from user_mst where reporting = ? AND status = 'Y'";

  try {
    db.query(query, [empcode], (err, result) => {
      if (err) {
        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        res.status(200).json(result);
      }
    });
  } catch (error) {
    res.send(error);
  }
};

exports.getAllEmployee = async (req, res) => {

  const page = parseInt(req.query.page) || 1;
  const limit = parseInt(req.query.limit) || 20;
  const offset = (page - 1) * limit;
  const searchName = req.query.searchName || '';


  const query =`select user_id,name,empcode,hq,state,reporting from user_mst where name LIKE '%${searchName}%' AND status = 'Y' LIMIT ${limit} OFFSET ${offset}`
  totalRowCountQuery = `SELECT COUNT(*) as totalCount FROM user_mst where name LIKE '%${searchName}%' AND status = 'Y'`;

  try {
    const users = await new Promise((resolve, reject) => {
      db.query(query, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result);
        }
      });
    });

    const totalRowCountResult = await new Promise((resolve, reject) => {
      db.query(totalRowCountQuery, (err, result) => {
        if (err) {
          logger.error(err.message);
          reject(err);
        } else {
          resolve(result[0]);
        }
      });
    });

    res.status(200).json({users,totalCount:totalRowCountResult.totalCount})
  } catch (error) {
    res.send(error);
  }
};


exports.deleteEmployee = async (req, res) => {
    const userId = req.params.id;  
 
    const query = 'update user_mst set status = "N" where user_id =?'
    try {
      db.query(query, [userId], (err, result) => {
        if (err) {
        logger.error(err.message);

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
        logger.info('Employee Delete Successfully');

          res.status(200).json({ message: "Employee Deleted Successfully",errorCode: "1"})
        } 
      });
    } catch (error) {
      logger.error(error.message);

      res.send(error)
    }
  };

  exports.getEmployeeWithId = async (req, res) => {
    const userId = req.params.id;  
 
    const query = 'select * from user_mst where user_id = ? AND status = "Y"'
    try {
      db.query(query, [userId], (err, result) => {
        if (err) {
        logger.error(err.message);

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
        logger.info('Fetch Employee Successfully');

          res.status(200).json({ user:result,errorCode: "1"})
        } 
      });
    } catch (error) {
      logger.error(error.message);

      res.send(error)
    }
  };


  exports.UpdateEmployee = (req, res) => {
    const id = req.params.id;

    const { name, empcode, state, hq, pincode, reporting, password, role } = req.body;
    
    const updateData = {};
    if (name) {
      updateData.name = name;
    }
    if (empcode) {
      updateData.empcode = empcode;
    }
    if (state) {
      updateData.state = state;
    }
    if (hq) {
      updateData.hq = hq;
    }
    
    if(pincode){
      updateData.pincode = pincode
    }
    if (reporting) {
      updateData.reporting = reporting;
    }
    if(password){
      updateData.password = password
    }
    if(role){
      updateData.role = role
    }
  
    db.query("UPDATE user_mst SET ? WHERE user_id = ?", [updateData, id], (err, rows) => {
       try {
        if (err) {
          logger.error(err.message);
  
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
          logger.info('Employee Update Successfully');
  
            res.status(200).json({ message:"Employee Update Successfully",errorCode: "1"})
          }
       } catch (error) {
        logger.error(error.message);

        res.send(error)
       } 
    });
  };  

  exports.getDataForImageDownload = async (req, res) => {

    const userId = req.params.userId
    //console.log(userId)
    const query = `
    select camp_report_mst.doctor_name,
     camp_report_mst.crid, camp_report_mst.created_date,camp_report_img_mst.imgpath
      from camp_report_mst INNER JOIN
       camp_report_img_mst on camp_report_mst.crid = camp_report_img_mst.crid WHERE camp_report_mst.user_id=? AND camp_report_mst.status = 'Y';
   `;
  
    try {
      db.query(query,[userId], (err, result) => {
        if (err) {
          logger.error(err.message);
  
          res.status(500).json({
            errorCode: "0",
            errorDetail: err.message,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred"
          });
        } else {
          logger.info('Fetch Employee Successfully');
          //console.log(result)
          // Transform the data into the desired format
          const transformedData = transformData(result);
  
          res.status(200).json(transformedData);
          //res.status(200).json(result);

        }
      });
    } catch (error) {
      logger.error(error.message);
  
      res.send(error);
    }
  };
  
  

  function transformData(data) {
    const transformedData = [];
  
    data.forEach((item) => {
      // Check if the person already exists in the transformed data
      const existingDoctor = transformedData.find((e) => e.crid === item.crid);
  
      if (!existingDoctor) {
        // If the doctor doesn't exist, create a new entry
        const newDoctor = {
          doctor_name: item.doctor_name,
          crid: item.crid,
          camp_date:moment(item.camp_date).format('DD-MM-YYYY'),
          images: [{ imgpath: item.imgpath }]
        };
  
        transformedData.push(newDoctor);
      } else {
        // If the doctor exists, add the image to the existing doctor
        existingDoctor.images.push({ imgpath: item.imgpath });
      }
    });
  
    return transformedData;
  }


  // download report hierekeywise 

  exports.getReportNumberWise = async (req, res) => {
    const { subCatId,startDate,endDate } = req.query;
    
     
    const query = 'CALL  AV_GetCampReportFinalSummary_DateRange(?,?,?)'
    try {
      db.query(query,[subCatId,startDate,endDate] ,(err, result) => {
        if (err) {
        logger.error(err.message);

          res.status(500).json({
            errorCode: "0",
            errorDetail: err,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred",
          });
        } else {
        logger.info('Fetched All Records in NumberWise');

          res.status(200).json(result);
        }
      });
    } catch (error) {
      logger.error(error.message);

      res.json(error);
    }
  };


exports.getReportDetailed = async (req, res) => {
const query = `SELECT 
    u1.empcode, 
    u1.name AS username,
    camp_report_mst.crid,
    camp_report_mst.doctor_name,
    camp_report_mst.code,
    camp_report_mst.created_date, 
    subcategory_mst.subcategory_name,
    COALESCE(MAX(qcrm1.answer), 0) AS screened_count, 
    COALESCE(MAX(qcrm2.answer), 0) AS diagnosed_count,
    COALESCE(MAX(qcrm3.answer), 0) AS prescription_count,
    COALESCE(GROUP_CONCAT(DISTINCT basic_mst.description ORDER BY basic_mst.description SEPARATOR ', '), 'N/A') AS brand_names,
    
    -- Patient details
    p.pa_id, p.subcat_id, p.name AS patient_name, p.age, p.gender, p.bp, p.sbp, p.dbp,
    p.isHypertensive, p.tc, p.tg, p.nonhdl, p.hdl, p.ldl, p.ldlhdl, 
    p.created_date AS patient_created_date

FROM camp_report_mst

LEFT JOIN user_mst u1 ON u1.user_id = camp_report_mst.user_id
INNER JOIN subcategory_mst ON camp_report_mst.subcat_id = subcategory_mst.subcategory_id

-- Question mappings
LEFT JOIN question_camp_rep_mapping qcrm1 ON qcrm1.crid = camp_report_mst.crid AND qcrm1.rqid IN (1, 4, 7)  
LEFT JOIN question_camp_rep_mapping qcrm2 ON qcrm2.crid = camp_report_mst.crid AND qcrm2.rqid IN (2, 5, 8)  
LEFT JOIN question_camp_rep_mapping qcrm3 ON qcrm3.crid = camp_report_mst.crid AND qcrm3.rqid IN (3, 6, 9) 

-- Brands
LEFT JOIN question_camp_rep_mapping qcrm_brand ON qcrm_brand.crid = camp_report_mst.crid  
LEFT JOIN basic_mst ON FIND_IN_SET(basic_mst.basic_id, qcrm_brand.brand_id) > 0

-- Patients (1 row per patient)
LEFT JOIN patient_mst p ON p.crid = camp_report_mst.crid 

WHERE camp_report_mst.status = 'Y'

GROUP BY 
    camp_report_mst.crid, p.pa_id`


    try {
      db.query(query ,(err, result) => {
        if (err) {
        logger.error(err.message);

          res.status(500).json({
            errorCode: "0",
            errorDetail: err,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred",
          });
        } else {
        const formattedResult = result.map((row) => ({
          ...row,
          camp_date: moment(row.camp_date).format('DD-MM-YYYY'), 
          created_date: moment(row.created_date).format('DD-MM-YYYY HH:mm'),
          modified_date: moment(row.modified_date).format('DD-MM-YYYY HH:mm'),// Format the date here
        }));
          res.status(200).json(formattedResult);
        }
      });
    } catch (error) {
      logger.error(error.message);

      res.json(error);
    }
  };


  exports.getReportDetailed1 = async (req, res) => {
  const { userId } = req.body; // Receive from frontend
  const reportingQuery = `
    WITH RECURSIVE user_hierarchy AS (
      SELECT user_id, empcode FROM user_mst WHERE user_id = ?
      UNION ALL
      SELECT u.user_id, u.empcode
      FROM user_mst u
      INNER JOIN user_hierarchy uh ON u.reporting = uh.empcode
    )
    SELECT user_id FROM user_hierarchy;
  `;

  try {
    db.query(reportingQuery, [userId], (err1, userResult) => {
      if (err1) {
        logger.error("Error fetching user hierarchy:", err1.message);
        return res.status(500).json({
          errorCode: "0",
          errorDetail: err1,
          status: "ERROR",
          details: "Error fetching user hierarchy",
        });
      }

      const userIds = userResult.map(u => u.user_id);
      if (!userIds.length) {
        return res.status(200).json({ message: "No users found in hierarchy", data: [] });
      }

      const placeholders = userIds.map(() => '?').join(',');

      const query = `
        SELECT 
          u1.empcode, 
          u1.name AS username,
          camp_report_mst.crid,
          camp_report_mst.doctor_name,
          camp_report_mst.code,
          camp_report_mst.created_date, 
          subcategory_mst.subcategory_name,
          COALESCE(MAX(qcrm1.answer), 0) AS screened_count, 
          COALESCE(MAX(qcrm2.answer), 0) AS diagnosed_count,
          COALESCE(MAX(qcrm3.answer), 0) AS prescription_count,
          COALESCE(GROUP_CONCAT(DISTINCT basic_mst.description ORDER BY basic_mst.description SEPARATOR ', '), 'N/A') AS brand_names,
          
          -- Patient details
          p.pa_id, p.subcat_id, p.name AS patient_name, p.age, p.gender, p.bp, p.sbp, p.dbp,
          p.isHypertensive, p.tc, p.tg, p.nonhdl, p.hdl, p.ldl, p.ldlhdl, 
          p.created_date AS patient_created_date

        FROM camp_report_mst

        LEFT JOIN user_mst u1 ON u1.user_id = camp_report_mst.user_id
        INNER JOIN subcategory_mst ON camp_report_mst.subcat_id = subcategory_mst.subcategory_id

        -- Question mappings
        LEFT JOIN question_camp_rep_mapping qcrm1 ON qcrm1.crid = camp_report_mst.crid AND qcrm1.rqid IN (1, 4, 7)  
        LEFT JOIN question_camp_rep_mapping qcrm2 ON qcrm2.crid = camp_report_mst.crid AND qcrm2.rqid IN (2, 5, 8)  
        LEFT JOIN question_camp_rep_mapping qcrm3 ON qcrm3.crid = camp_report_mst.crid AND qcrm3.rqid IN (3, 6, 9) 

        -- Brands
        LEFT JOIN question_camp_rep_mapping qcrm_brand ON qcrm_brand.crid = camp_report_mst.crid  
        LEFT JOIN basic_mst ON FIND_IN_SET(basic_mst.basic_id, qcrm_brand.brand_id) > 0

        -- Patients
        LEFT JOIN patient_mst p ON p.crid = camp_report_mst.crid 

        WHERE camp_report_mst.status = 'Y'
        AND camp_report_mst.user_id IN (${placeholders})

        GROUP BY 
          camp_report_mst.crid, p.pa_id
      `;

      db.query(query, userIds, (err2, result) => {
        if (err2) {
          logger.error("Error running main report query:", err2.message);
          return res.status(500).json({
            errorCode: "0",
            errorDetail: err2,
            responseData: {},
            status: "ERROR",
            details: "Error fetching report data"
          });
        }

        const formattedResult = result.map((row) => ({
          ...row,
          camp_date: row.camp_date ? moment(row.camp_date).format('DD-MM-YYYY') : null,
          created_date: row.created_date ? moment(row.created_date).format('DD-MM-YYYY HH:mm') : null,
          modified_date: row.modified_date ? moment(row.modified_date).format('DD-MM-YYYY HH:mm') : null,
          patient_created_date: row.patient_created_date ? moment(row.patient_created_date).format('DD-MM-YYYY HH:mm') : null
        }));

        return res.status(200).json(formattedResult);
      });
    });
  } catch (error) {
    logger.error("Unexpected error in getReportDetailed:", error.message);
    res.status(500).json({
      errorCode: "0",
      errorDetail: error.message,
      responseData: {},
      status: "ERROR",
      details: "An internal server error occurred"
    });
  }
};


  exports.getReportFromTop = async (req, res) => {
    const { empcode,subCatId,startDate,endDate } = req.query;
    
     
    const query = 'CALL AV_GetCampReportFinalSummary_EmpCodeDateRange(?,?,?,?)'
    try {
      db.query(query,[empcode,subCatId,startDate,endDate] ,(err, result) => {
        if (err) {
        logger.error(err.message);

          res.status(500).json({
            errorCode: "0",
            errorDetail: err,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred",
          });
        } else {
        logger.info('Fetched All Records From TopLine');

          res.status(200).json(result);
        }
      });
    } catch (error) {
      logger.error(error.message);

      res.json(error);
    }
  };


  // for doctor count
  exports.totalDoctorCount = async (req, res) => {
   
    const {catValue} = req.body;
    
    let query;
    if(catValue){

      query = `
       SELECT
       COUNT(DISTINCT doctor_name) AS doctor_count,
       MONTH(created_date) AS report_month,
       YEAR(created_date) AS report_year
       FROM
       camp_report_mst
       WHERE
       created_date >= CURDATE() - INTERVAL 6 MONTH
       AND subcat_id = ${catValue}
       AND camp_report_mst.status = 'Y'
       GROUP BY
       report_year, report_month;
       `
    }
    else{
      query = `
      SELECT
      COUNT(DISTINCT doctor_name) AS doctor_count,
      MONTH(created_date) AS report_month,
      YEAR(created_date) AS report_year
      FROM
      camp_report_mst
      WHERE
      created_date >= CURDATE() - INTERVAL 6 MONTH
      AND camp_report_mst.status = 'Y'
      GROUP BY
      report_year, report_month;
      `
    }

    try {
      db.query(query, (err, result) => {
        if (err) {
          logger.error(err.message);
          res.status(500).json({
            errorCode: "0",
            errorDetail: err.message,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred",
          });
        } else {
          logger.info("Fetched total doctors");
          res.status(200).json(result);
        }
      });
    } catch (error) {
      logger.error(error.message);
      res.json(error);
    }
  };


  // for Camp count
  exports.totalCampCount = async (req, res) => {
   
    const {catValue} = req.body;
    
    let query;
    if(catValue){

      query = `
       SELECT
       COUNT(*) as Camp_Count,
       MONTH(created_date) AS report_month,
       YEAR(created_date) AS report_year
       FROM
       camp_report_mst
       WHERE
       created_date >= CURDATE() - INTERVAL 6 MONTH
       AND subcat_id = ${catValue}
       AND camp_report_mst.status = 'Y'
       GROUP BY
       report_year, report_month;
       `
    }
    else{
      query = `
      SELECT
    COUNT(*) as Camp_Count,
    MONTH(created_date) AS report_month,
    YEAR(created_date) AS report_year
FROM
    camp_report_mst
WHERE
    created_date >= CURDATE() - INTERVAL 6 MONTH
    AND camp_report_mst.status = 'Y'
GROUP BY
    report_year, report_month;
      `
    }

    try {
      db.query(query, (err, result) => {
        if (err) {
          logger.error(err.message);
          res.status(500).json({
            errorCode: "0",
            errorDetail: err.message,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred",
          });
        } else {
          logger.info("Fetched total camps");
          res.status(200).json(result);
        }
      });
    } catch (error) {
      logger.error(error.message);
      res.json(error);
    }
  };


 // for Camp count
exports.totalPatientScreened = async (req, res) => {
  const { catValue } = req.body;

  let query;
  let queryParams = [];

  if (catValue) {
    query = `
      SELECT COALESCE(SUM(answer), 0) AS Screened_Count,
             MONTH(camp_report_mst.created_date) AS report_month,
             YEAR(camp_report_mst.created_date) AS report_year
      FROM camp_report_mst
      INNER JOIN question_camp_rep_mapping 
              ON question_camp_rep_mapping.crid = camp_report_mst.crid
      WHERE question_camp_rep_mapping.rqid IN (1, 4, 7)
        AND question_camp_rep_mapping.subcat_id = ?
        AND camp_report_mst.created_date >= CURDATE() - INTERVAL 6 MONTH
        AND camp_report_mst.status = 'Y'
      GROUP BY report_month, report_year;
    `;
    queryParams.push(catValue);
  } else {
    query = `
      SELECT COALESCE(SUM(answer), 0) AS Screened_Count,
             MONTH(camp_report_mst.created_date) AS report_month,
             YEAR(camp_report_mst.created_date) AS report_year
      FROM camp_report_mst
      INNER JOIN question_camp_rep_mapping 
              ON question_camp_rep_mapping.crid = camp_report_mst.crid
      WHERE question_camp_rep_mapping.rqid IN (1, 4, 7)
        AND camp_report_mst.created_date >= CURDATE() - INTERVAL 6 MONTH
        AND camp_report_mst.status = 'Y'
      GROUP BY report_month, report_year;
    `;
  }

  try {
    db.query(query, queryParams, (err, result) => {
      if (err) {
        logger.error(err.message);
        return res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      }

      logger.info("Fetched total screen");
      res.status(200).json(result);
    });
  } catch (error) {
    logger.error(error.message);
    res.status(500).json({
      errorCode: "0",
      errorDetail: error.message,
      responseData: {},
      status: "ERROR",
      details: "Exception thrown",
      getMessageInfo: "Something went wrong",
    });
  }
};


exports.totalPatientDiagnosed = async (req, res) => {
 
  const {catValue} = req.body;
  let queryParams = [];
  let query;
  if(catValue){

    query = `
    SELECT COALESCE(SUM(answer), 0) AS Daignosed_Count,
    MONTH(camp_report_mst.created_date) AS report_month,
    YEAR(camp_report_mst.created_date) AS report_year
FROM
    camp_report_mst
    INNER JOIN question_camp_rep_mapping ON question_camp_rep_mapping.crid = camp_report_mst.crid
WHERE
    question_camp_rep_mapping.rqid IN (2,5,8)
    AND question_camp_rep_mapping.subcat_id = ?
    AND camp_report_mst.created_date >= CURDATE() - INTERVAL 6 MONTH
    AND camp_report_mst.status = 'Y'
GROUP BY
    report_month, report_year;
     `
     queryParams.push(catValue)
  }
  else{
    query = `
    SELECT COALESCE(SUM(answer), 0) AS Daignosed_Count,
  MONTH(camp_report_mst.created_date) AS report_month,
  YEAR(camp_report_mst.created_date) AS report_year
FROM
  camp_report_mst
  INNER JOIN question_camp_rep_mapping ON question_camp_rep_mapping.crid = camp_report_mst.crid
WHERE
  question_camp_rep_mapping.rqid IN (2,5,8)
  AND camp_report_mst.created_date >= CURDATE() - INTERVAL 6 MONTH
  AND camp_report_mst.status = 'Y'
GROUP BY
  report_month, report_year;
    `
  }

  try {
    db.query(query, queryParams, (err, result) => {
      if (err) {
        logger.error(err.message);
        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        logger.info("Fetched total Diagnose");
        res.status(200).json(result);
      }
    });
  } catch (error) {
    logger.error(error.message);
    res.json(error);
  }
};


exports.getPatientsList = async (req, res) => {
  const { catId, startDate, endDate } = req.body;

  let query = `
    SELECT 
      p.pa_id, p.subcat_id, p.name, p.age, p.gender, p.bp, p.sbp, p.dbp,
      p.isHypertensive, p.tc, p.tg, p.nonhdl, p.hdl, p.ldl, p.ldlhdl, 
      p.created_date,
      u.name AS empname, u.designation
    FROM patient_mst AS p
    LEFT JOIN user_mst u ON u.user_id = p.created_by
    WHERE p.status = "Y"
  `;

  const params = [];

  if (catId) {
    query += ` AND p.subcat_id = ?`;
    params.push(catId);
  }

  if (startDate && endDate) {
    query += ` AND DATE(p.created_date) BETWEEN ? AND ?`;
    params.push(startDate, endDate);
  }

  query += ` ORDER BY p.created_date DESC`;

  try {
    db.query(query, params, (err, result) => {
      if (err) {
        logger.error(err.message);
        res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred",
        });
      } else {
        logger.info("Fetched filtered patients");
        res.status(200).json({
          message: "Patients list fetched successfully",
          errorCode: 1,
          data: result,
        });
      }
    });
  } catch (error) {
    logger.error(error.message);
    res.status(500).json({
      errorCode: "0",
      errorDetail: error.message,
      status: "ERROR",
    });
  }
};