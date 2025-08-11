
const db = require("../config/db")
const moment = require('moment');
const logger = require('../utils/logger')
const fs = require('fs');
const path = require('path');

exports.addDoctor = async (req, res) => {
  const { userId,doctorName, code, campDate, campVenue, campTime,subCatId } = req.body;
  const formattedCampDate = moment(campDate, 'DD-MM-YYYY').format('YYYY-MM-DD');
  const filename = req.file && req.file.filename ? req.file.filename : null;
  //const query = 'CALL AddDoctor(?, ?, ?, ?, ?, ?, ?)'
  const query = 'INSERT INTO doctor_mst (doctor_name, doctor_img, camp_date, camp_time, code, camp_venue,subcat_id, user_id, created_by) VALUES (?,?,?,?,?,?,?,?,?);'
  try {
        db.query(query, [doctorName, filename, formattedCampDate,campTime, code, campVenue, subCatId, userId,userId], (err, result) => {
          if (err) {
            logger.error(`Error in /controller/doctor/addDoctor: ${err.message}. SQL query: ${query}`);
            res.status(500).json({
              errorCode: "0",
              errorDetail: err,
              responseData: {},
              status: "ERROR",
              details: "An internal server error occurred",
              getMessageInfo: "An internal server error occurred"
            });
          }
          else{
            const docid = result.insertId;
            res.status(200).json({ message: "Doctor Added Successfully",
            errorCode: "1",
            docid
          })
          } 
        });
      } catch (error) {
        logger.error(`Error in /controller/doctor/addDoctor: ${error.message}`);
        res.send(error)
      }
};

  // update doctor code for updating doctor images with new one  the doctor images 
  exports.updateDoctor = async (req, res) => {
   
  const {userId,doctorId,doctorName, campDate, campVenue,code, campTime, doctorImg } = req.body;
  const formattedCampDate = moment(campDate, 'DD-MM-YYYY').format('YYYY-MM-DD');


    let filename;
    if (req.file) {
      
            filename = req.file.filename;
            // Check if there was an existing image filename in the request
    const existingImageFilename = doctorImg;

    // Delete the existing image from your filesystem if it exists
    if (existingImageFilename) {
      fs.unlink(`./uploads/profile/${existingImageFilename}`, (unlinkErr) => {
        if (unlinkErr) {
          console.error('Error deleting image: ', unlinkErr);
        }
      });
    }
          }
    const query = 'CALL UpdateDoctor(?, ?, ?, ?, ?, ?, ?, ?)'
  
    try {
      db.query(query, [userId,doctorId,doctorName, filename, formattedCampDate,campTime, campVenue,code], (err, result) => {
        if (err) {
          logger.error(`Error in /controller/doctor/updateDoctor: ${err.message}. SQL query: ${query}`);


          res.status(500).json({
            errorCode: "0",
            errorDetail: err,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred"
          });
        }
        else{
        logger.info('Doctor Update Successfully');

          res.status(200).json({
             message: "Doctor Update Successfully",errorCode: "1"})
        } 
      });
    } catch (error) {
      logger.error(`Error in /controller/doctor/updateDoctor: ${error.message}. SQL query: ${query}`);


      res.send(error)
    }
  };

  // for get doctor data
  exports.getDoctorDataWithUserId = async (req, res) => {
    const {userId,subCatId} = req.body
    const query = "select doctor_id,doctor_name,code,camp_venue,camp_date,camp_time,doctor_img,doctor_qualification,doctor_city,doctor_state from doctor_mst where user_id = ? and subcat_id = ? and status = 'Y' ORDER BY doctor_mst.doctor_id DESC"
    // const query = 'CALL GetDoctorDataWithUserId(?,?)'
    try {
      db.query(query,[userId,subCatId],(err, result) => {
        if (err) {
          logger.error(`Error in /controller/doctor/getDoctorDataWithUserId: ${err.message}. SQL query: ${query}`);

          res.status(500).json({
            errorCode: "0",
            errorDetail: err,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred"
          });
        }
        else{
            
          const formattedResult = result.map((item) => ({
            ...item,
            camp_date: moment(item.camp_date).format('DD-MM-YYYY'), // Convert date format
          }));
     
         
           res.status(200).json({message: "Doctor List get Successfully",errorCode: 1, data:formattedResult})
          
        } 
      });
    } catch (error) {
      logger.error(`Error in /controller/doctor/getDoctorDataWithUserId: ${error.message}. SQL query: ${query}`);
      res.send(error)
    }
  };



  exports.getDoctorWithId = async (req, res) => {
    const {doctorId} = req.body;
    const query = 'select doctor_id,doctor_name,code,doctor_img,doctor_qualification,doctor_city,doctor_state, camp_date, camp_venue, camp_time from doctor_mst where doctor_id = ?'
  
    try {
      db.query(query,[doctorId],(err, result) => {
        if (err) {
          logger.error(`Error in /controller/doctor/getDoctorWithId: ${err.message}. SQL query: ${query}`);


          res.status(500).json({
            errorCode: "INTERNAL_SERVER_ERROR",
            errorDetail: err.message,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred"
          });
        }
        else{
          if(result.length==0){
         return  res.status(404).json({
              errorCode: "0",
              errorDetail: "Doctor Not found with id",
              responseData: {},
              status: "ERROR",
              details: "Doctor Not found with id",
              getMessageInfo: "Doctor Not found with id"
            });
            
          }
        const formattedResult = result.map((item) => ({
          ...item,
          camp_date: moment(item.camp_date).format('DD-MM-YYYY'), // Convert date format
        }));
          res.status(200).json({message: "Doctor data get Successfully",errorCode: 1, data:formattedResult})
        } 
      });
    } catch (error) {
      logger.error(`Error in /controller/doctor/getDoctorWithId: ${error.message}. SQL query: ${query}`);

      res.send(error)
    }
  };  

  
  // exports.deleteDoctorWithId = async (req, res) => {
  //   const {doctorId} = req.body;  

  //   const query = 'delete from doctor_mst where doctor_id=?'
  //   //const query = 'CALL DeleteDoctor(?)'
  //   try {
  //     db.query(query, [doctorId], (err, result) => {
  //       if (err) {
  //       logger.error(err.message);

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
  //       logger.info('Doctor Delete Successfully');

  //         res.status(200).json({ message: "Doctor Deleted Successfully",errorCode: "1"})
  //       } 
  //     });
  //   } catch (error) {
  //     logger.error(error.message);

  //     res.send(error)
  //   }
  // };
   
  exports.deleteDoctorWithId = async (req, res) => {
  const { doctorId } = req.body;

  // Step 1: Get image file name
  const queryGetImageFileName = 'SELECT doctor_img FROM doctor_mst WHERE doctor_id = ?';

  try {
    db.query(queryGetImageFileName, [doctorId], (err, result) => {
      if (err) {
        logger.error(`Error in /controller/doctor/deleteDoctorWithId: ${err.message}`);
        return res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred"
        });
      }

      if (result.length === 0) {
        return res.status(404).json({ message: "Doctor not found", errorCode: "0" });
      }

      const imageFileName = result[0].doctor_img;

      // Step 2: Update status first
      const queryDeleteDoctor = "UPDATE doctor_mst SET status = 'N' WHERE doctor_id = ?";
      db.query(queryDeleteDoctor, [doctorId], (deleteErr, deleteResult) => {
        if (deleteErr) {
          logger.error(`Error updating status in deleteDoctorWithId: ${deleteErr.message}`);
          return res.status(500).json({
            errorCode: "0",
            errorDetail: deleteErr.message,
            responseData: {},
            status: "ERROR",
            details: "An internal server error occurred",
            getMessageInfo: "An internal server error occurred"
          });
        }

        logger.info('Doctor status updated successfully');

        // Step 3: Delete image file
        fs.unlink(`./uploads/profile/${imageFileName}`, (unlinkErr) => {
          if (unlinkErr) {
            logger.warn(`Image file not found or error deleting: ${unlinkErr.message}`);
            // We don't block the response for image delete failure
          } else {
            logger.info('Image file deleted successfully');
          }
        });

        res.status(200).json({
          message: "Doctor deleted successfully",
          errorCode: "1"
        });
      });
    });
  } catch (error) {
    logger.error(`Unexpected error in deleteDoctorWithId: ${error.message}`);
    res.status(500).json({
      errorCode: "0",
      errorDetail: error.message,
      responseData: {},
      status: "ERROR",
      details: "An internal server error occurred",
      getMessageInfo: "An internal server error occurred"
    });
  }
};








  exports.searchDoctorWithUserId = async (req, res) => {
    const {userId} = req.body;  
    const searchQuery = req.query.search || '';
    //const query = `select doctor_id,doctor_name,doctor_img,doctor_qualification,doctor_city,doctor_state,status from doctor_mst where user_id=${user_id} and doctor_name LIKE '%${searchQuery}%'`
    const query = 'CALL SearchDoctorWithUserId(?, ?)';
    try {
      db.query(query,[userId,searchQuery],(err, result) => {
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
          res.status(200).json(result)
        } 
      });
    } catch (error) {
      logger.error(error.message);

      res.send(error)
    }
  };


  exports.getDoctorWithIdForPoster = async (req, res) => {
    const {doctorId,dcId} = req.body
    //const query = 'SELECT doctor_mst.doctor_name, doctor_mst.doctor_img, doctor_camp_mapping.camp_date,doctor_camp_mapping.camp_venue FROM doctor_mst INNER JOIN doctor_camp_mapping ON doctor_mst.doctor_id = doctor_camp_mapping.doctor_id WHERE doctor_mst.doctor_id = ?';
    const query = 'CALL GetDoctorInfoForPoster(?,?)';
    try {
      db.query(query,[doctorId,dcId],(err, result) => {
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
       
        // else if (result.length === 0) {
        //   logger.warn('Doctor Not Found');
        //   res.status(404).json({
        //     errorCode: "0",
        //     errorDetail: "Doctor not found",
        //     responseData: {},
        //     status: "ERROR",
        //     details: "Not Found",
        //     getMessageInfo: "Doctor not found"
        //   });
        // }
        else{
          
          const formattedResult = result[0].map((item) => ({
            ...item,
            camp_date: moment(item.camp_date).format('DD-MM-YYYY'), // Convert date format
          }));
        logger.info('Doctor fetched for poster');
          
          res.status(200).json(formattedResult);
        } 
      });
    } catch (error) {
      logger.error(error.message);

      res.send(error)
    }
  };  

   exports.getDoctorPoster = async (req, res) => {
    const {docId,lang,subCatId} = req.body
    const query = 'SELECT doctor_id, poster_name from user_poster_mst where doctor_id = ? and p_lang = ? and subcat_id = ?';
 
    try {
      db.query(query,[docId,lang,subCatId],(err, result) => {
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
          res.status(200).json({message:"Poster get successfully",errorCode:1, data:result});
        } 
      });
    } catch (error) {
      logger.error(error.message);
      res.send(error)
    }
  };  


  exports.findDoctorPresent = async (req, res) => {
    const {doctorName} = req.body
    const query = 'SELECT doctor_name FROM doctor_mst WHERE doctor_name = ?';
 
    try {
      db.query(query,[doctorName],(err, result) => {
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
        else if (result.length === 0) {
          logger.warn('Doctor Not Found');
          res.status(404).json({
            errorCode: "0",
            errorDetail: "Doctor not found",
            responseData: {},
            status: "ERROR",
            details: "Not Found",
            getMessageInfo: "Doctor not found"
          });
        }
        else{
        logger.info('Doctor find Successfully');
          
          res.status(200).json({ message: "Doctor find Successfully",errorCode: "1"
        })
        } 
      });
    } catch (error) {
      logger.error(error.message);

      res.send(error)
    }
  };  


  exports.getNormalPoster = async(req,res)=>{
    const {lang,subCatId} = req.body;
     const query = 'select poster_id, poster_path from poster_mst1 where language = ? and subcat_id = ?'
     try {
 
         db.query(query,[lang,subCatId],(error, result)=>{
             if(error){
                 logger.error(`Error in /controller/doctor/getNormalPoster: ${err.message}. SQL query: ${query}`);
                 res.status(500).json({
                     errorCode: "INTERNAL_SERVER_ERROR",
                     errorDetail: err.message,
                     responseData: {},
                     status: "ERROR",
                     details: "An internal server error occurred",
                     getMessageInfo: "An internal server error occurred"
                   });
             }
             else{
                 logger.info('Fetched Normal Poster');
                 res.status(200).json(result);
             }
         })
         
     } catch (error) {
         res.send(error);
     }
 }