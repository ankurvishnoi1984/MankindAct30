
const db = require("../config/db")
const moment = require('moment');
const logger = require('../utils/logger')
const fs = require('fs');
const path = require('path');

exports.addReportWithInfo = async (req, res) => {  
  
  const {userId,subCatId,empcode,doctorName,code} = req.body;
  //const formattedCampDate = moment(campDate, 'DD-MM-YYYY').format('YYYY-MM-DD');
  const query = 'insert into camp_report_mst (doctor_name,code,user_id,subcat_id,created_by) values(?,?,?,?,?)';
  //const query = 'CALL AddCamp(?, ?, ?, ?, ?)'
  //const query = 'CALL AddCampReportWithInfo(?, ?, ?, ?, ?)'
  try {
    db.query(query, [doctorName,code,userId,subCatId,userId], (err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/addReportWithInfo: ${err.message}`);
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
        const crid = result.insertId;

        res.status(200).json({ message: "Camp Report Added Successfully",errorCode:1,crid})
      } 
    });
  } catch (error) {
  logger.error(`Error in /controller/report/addReportWithInfo: ${error.message}`);
    res.send(error)
  }
};


exports.updateReportWithInfo = async (req,res)=>{
  
  const {userId,crId,empcode,code,doctorName} = req.body;
  
  //const formattedCampDate = moment(campDate, 'DD-MM-YYYY').format('YYYY-MM-DD');

   const query = 'CALL UpdateCampReportWithInfo(?, ?, ?, ?)'
  try {
    db.query(query, [crId, code, doctorName, userId], (err, result) => {
      if (err) {
               logger.error(`Error in /controller/report/updateReportWithInfo: ${err.message}`);

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
        res.status(200).json({
           message: "ReportInfo Update Successfully",
           errorCode: 1
          })
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/updateReportWithInfo: ${err.message}`);
    res.send(error)
  }
}


exports.getReportInfoWithId = async (req, res) => {
  const {crId} = req.body;
  //const query = 'select crid,doctor_name,user_empcode,camp_date from camp_report_mst where crid = ?'
  const query = 'SELECT camp_report_mst.crid,camp_report_mst.doctor_name,camp_report_mst.code FROM camp_report_mst WHERE camp_report_mst.crid = ?;'
  try {
    db.query(query,[crId],(err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/getReportInfoWithId: ${err.message}`);
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
        res.status(200).json({message:"camp report get successfully",errorCode: 1, data: result});
      } 
    });
  } catch (error) {
          logger.error(`Error in /controller/report/getReportInfoWithId: ${error.message}`);

    res.send(error)
  }
};  


  // get all question with subcategory id 
  
  exports.getAllQuestionWithSubCatId = async (req, res) => {
      
    const {subCatId} = req.body
        
    const query = 'select rqid,question from report_ques_mst  where subcat_id= ? and status= "Y"'

    try {
      db.query(query,[subCatId],(err, result) => {
        if (err) {
       logger.error(`Error in /controller/report/getAllQuestionWithSubCatId: ${err.message}`);
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
      
          res.status(200).json({message:"Question list get successfully",errorCode:1,data:result})
        } 
      });
    } catch (error) {
      logger.error(`Error in /controller/report/getAllQuestionWithSubCatId: ${error.message}`);
      res.send(error)
    }
  };


 // image upload 
//  exports.uploadImage = async (req, res) => { 
//     const {crId,user_id} = req.body;
//     const filenames = req.files.map((file)=>file.filename)
//     const query = 'insert into camp_report_img_mst (crid,imgpath,created_by,modified_by) values(?,?,?,?)';
//     const values = filenames.map((filename)=>[crId,filename,user_id,user_id])
//     try {
//       db.query(query,values, (err, result) => {
//         if (err) {
//           res.status(500).json({
//             errorCode: "INTERNAL_SERVER_ERROR",
//             errorDetail: err,
//             responseData: {},
//             status: "ERROR",
//             details: "An internal server error occurred",
//             getMessageInfo: "An internal server error occurred"
//           });
//         }
//         else{
//           res.status(200).json({ message: "Images Upload Successfully"})
//         } 
//       });
//     } catch (error) {
//       res.send(error)
//     }
//   };

// exports.uploadImage = async (req, res) => { 
//   const { crId, userId,feedback} = req.body;
//   const filenames = req.files.map((file) => file.filename);

//   // Create placeholders for each set of values
//   const placeholders = filenames.map(() => "(?, ?, ?, ?, ?)").join(', ');

//   // Flatten the values into a single array
//   const values = filenames.flatMap((filename) => [crId, filename, feedback, userId, userId]);

//   // Construct the SQL query with the correct number of placeholders
//   const query = `INSERT INTO camp_report_img_mst (crid, imgpath, feedback, created_by, modified_by) VALUES ${placeholders}`;

//   try {
//     db.query(query, values, (err, result) => {
//       if (err) {
//         logger.error(err.message);

//         res.status(500).json({
//           errorCode: "INTERNAL_SERVER_ERROR",
//           errorDetail: err,
//           responseData: {},
//           status: "ERROR",
//           details: "An internal server error occurred",
//           getMessageInfo: "An internal server error occurred"
//         });
//       } else {
//         logger.info('Image Uploaded Successfully');

//         res.status(200).json({ message: "Images Upload Successfully", errorCode: "1"});
//       } 
//     });
//   } catch (error) {
//     logger.error(error.message);

//     res.send(error);
//   }
// };



exports.uploadImage = async (req, res) => { 
  const { crId, userId,feedback} = req.body;

  const files = req.files || [];
  let query;
  let values
  if(files.length>0){
    const filenames = req.files.map((file) => file.filename);

    // Create placeholders for each set of values
    const placeholders = filenames.map(() => "(?, ?, ?)").join(', ');
  
    // Flatten the values into a single array
     values = filenames.flatMap((filename) => [crId, filename, userId]);
  
    // Construct the SQL query with the correct number of placeholders
      query = `INSERT INTO camp_report_img_mst (crid, imgpath, created_by) VALUES ${placeholders}`;
  }
 

  try {
    db.query(query, values, (err, result) => {
      if (err) {
        logger.error(`Error in /controller/report/uploadImage: ${err.message}`);

        res.status(500).json({
          errorCode: "INTERNAL_SERVER_ERROR",
          errorDetail: err,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred"
        });
      } else {
        res.status(200).json({ message: "Images Upload Successfully", errorCode: 1});
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/uploadImage: ${error.message}`);
    res.send(error);
  }
};

exports.getImages = async (req, res) => {
  const {crId} = req.body;
  const query = 'select crimgid,imgpath from camp_report_img_mst where crid = ? and camp_report_img_mst.status = "Y"'

  try {
    db.query(query,[crId],(err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/getImages: ${err.message}`);

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
        res.status(200).json({message:"Images get successfully",errorCode:1,data:result})
      } 
    });
  } catch (error) {

  logger.error(`Error in /controller/report/getImages: ${err.message}`);
    res.send(error)
  }
}; 

// exports.updateImages = async (req, res) => {
//   // const { imageUpdates } = req.body;

//   // // Create placeholders for each set of values
//   // const placeholders = imageUpdates.map(() => "(?, ?, ?, ?)").join(', ');

//   // // Flatten the values into a single array
//   // const values = imageUpdates.flatMap((update) => [update.crId, update.imgpath, update.feedback, update.userId]);
   
//   const { crId, userId,feedback} = req.body;
//   const filenames = req.files.map((file) => file.filename);

//   // Create placeholders for each set of values
//   const placeholders = filenames.map(() => "(?, ?, ?, ?)").join(', ');

//   // Flatten the values into a single array
//   const values = filenames.flatMap((filename) => [crId, filename, feedback, userId]);
//   // Construct the SQL update query with the correct number of placeholders
//   const query = `
//     UPDATE camp_report_img_mst
//     SET feedback = ?,
//         modified_by = ?,
//         imgpath = ?,
//         modified_date = NOW()
//     WHERE crid = ?
//   `;

//   try {
//     db.query(query, values, (err, result) => {
//       if (err) {
//         res.status(500).json({
//           errorCode: "INTERNAL_SERVER_ERROR",
//           errorDetail: err,
//           responseData: {},
//           status: "ERROR",
//           details: "An internal server error occurred",
//           getMessageInfo: "An internal server error occurred"
//         });
//       } else {
//         // Check if any rows were affected (0 indicates an error)
//         if (result.affectedRows > 0) {
//           res.status(200).json({ message: "Images Updated Successfully", errorCode: "1" });
//         } else {
//           res.status(500).json({
//             errorCode: "INTERNAL_SERVER_ERROR",
//             errorDetail: "No rows were affected by the query",
//             responseData: {},
//             status: "ERROR",
//             details: "An internal server error occurred",
//             getMessageInfo: "An internal server error occurred"
//           });
//         }
//       }
//     });
//   } catch (error) {
//     res.send(error);
//   }
// };


// exports.addAnswer = async (req, res) => { 
//   const { dataArray } = req.body;

//   // Create placeholders for each set of values
//   const placeholders = dataArray.map(() => "(?, ?, ?)").join(', ');
   
//   // Flatten the values into a single array
//   const values = dataArray.flatMap((data) => [data.user_id, data.rqid, data.value]);

//   const query = "INSERT INTO report_ques_mapping (user_id, rqid, value) VALUES " + placeholders;

//   try {
//     db.query(query, values, (err, result) => {
//       if (err) {
//         res.status(500).json({
//           errorCode: "INTERNAL_SERVER_ERROR",
//           errorDetail: err,
//           responseData: {},
//           status: "ERROR",
//           details: "An internal server error occurred",
//           getMessageInfo: "An internal server error occurred"
//         });
//       } else {
//         res.status(200).json({ message: "Answers Added Successfully" });
//       } 
//     });
//   } catch (error) {
//     res.send(error);
//   }
// };

// exports.updateImages = async (req, res) => {
//   const {crimgId, crId, userId, feedback } = req.body;
//   const filenames = req.files.map((file) => file.filename);

//   try {
//     for (const filename of filenames) {
//       // Use the filename as the new imgpath value
      

//       // Construct the SQL update query with placeholders for imgpath
//       const query = `
//         UPDATE camp_report_img_mst
//         SET imgpath = ?,
//             feedback = ?,
//             modified_by = ?,
//             modified_date = NOW()
//         WHERE crid = ? AND crimgid = ?;
//       `;

//       // Execute the update query for each image
//       db.query(query, [filename, feedback, userId, crId,crimgId], (err, result) => {
//         if (err) {
//           console.error(err);
//         }
//       });
//     }

//     res.status(200).json({ message: "Images Updated Successfully", errorCode: "1" });
//   } catch (error) {
//     logger.error(error.message);

//     res.status(500).json({
//       errorCode: "INTERNAL_SERVER_ERROR",
//       errorDetail: error,
//       responseData: {},
//       status: "ERROR",
//       details: "An internal server error occurred",
//       getMessageInfo: "An internal server error occurred"
//     });
//   }
// };

exports.updateImages = async (req, res) => {
  const { crId, userId } = req.body;
  const filenames = req.files.map((file) => file.filename);
   
  let values;
  let query;
  if (filenames.length > 0) {
    const placeholders = filenames.map(() => "(?, ?, ?)").join(', ');
     values = filenames.flatMap((filename) => [crId, filename, userId]);
     query = `INSERT INTO camp_report_img_mst (crid, imgpath, created_by) VALUES ${placeholders}`;
  }

  try {
    db.query(query, values, (err, result) => {
      if (err) {
         logger.error(`Error in /controller/report/updateImages: ${err.message}`);
        res.status(500).json({
          errorCode: "INTERNAL_SERVER_ERROR",
          errorDetail: err,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred"
        });
      } else {
        
        res.status(200).json({ message: "image updated Successfully", errorCode: 1 });
      }
    });
  } catch (error) {
     logger.error(`Error in /controller/report/updateImage: ${err.message}`);
    res.send(error);
  }
};




exports.addAnswer = async (req, res) => { 
  const { dataArray } = req.body;

  // Create placeholders for each set of values
  const placeholders = dataArray.map(() => "(?, ?, ?, ?, ?, ?, ?, ?, ?)").join(', ');
   
  // Flatten the values into a single array
  const values = dataArray.flatMap((data) => [data.rqid,data.subCatId,data.value,data.crid,data.brand_id,data.user_id,data.other_brands,data.brand_count,data.other_brand_count]);
  const query = "INSERT INTO question_camp_rep_mapping (rqid, subcat_id, answer, crid, brand_id, created_by, other_brands,brand_count,other_brand_count) VALUES " + placeholders;

  try {
    db.query(query, values, (err, result) => {
      if (err) {
        logger.error(`Error in /controller/report/addAnswer: ${err.message}`);
        res.status(500).json({
          errorCode: "INTERNAL_SERVER_ERROR",
          errorDetail: err,
          responseData: {},
          status: "ERROR",
          details: "An internal server error occurred",
          getMessageInfo: "An internal server error occurred"
        });
      } else {
        res.status(200).json({ message: "Answers Added Successfully",errorCode:1 });
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/addAnswer: ${error.message}`);
    res.send(error);
  }
};


// exports.updateAnswer = async (req, res) => {
//   const { dataArray } = req.body;

//   try {
//     // Begin a transaction
//     db.beginTransaction(async (err) => {
//       if (err) {
//       logger.error(`Error in /controller/report/updateAnswer: ${err.message}`);

//         res.status(500).json({
//           errorCode: "INTERNAL_SERVER_ERROR",
//           errorDetail: err,
//           responseData: {},
//           status: "ERROR",
//           details: "An internal server error occurred",
//           getMessageInfo: "An internal server error occurred"
//         });
//         return;
//       }

//       for (const data of dataArray) {
//         const { rqid,crid, brand_id, value, user_id } = data;
//         const currentDateTime = moment().format('YYYY-MM-DD HH:mm:ss');
//         // Update the row where crid = 1 for each data item
//         const updateQuery = `
//           UPDATE question_camp_rep_mapping
//           SET answer = ?, brand_id = ?
//           WHERE crid = ? AND rqid = ?;
//         `;

//         // Execute the update query
//         await db.query(updateQuery, [value, brand_id, crid, rqid]);
//       }

//       // Commit the transaction when all updates are successful
//       db.commit((err) => {
//         if (err) {
//           // Rollback the transaction on error
//           logger.error(err.message)
//           db.rollback(() => {
//             res.status(500).json({
//               errorCode: "INTERNAL_SERVER_ERROR",
//               errorDetail: err,
//               responseData: {},
//               status: "ERROR",
//               details: "An internal server error occurred",
//               getMessageInfo: "An internal server error occurred"
//             });
//           });
//         } else {
//         logger.info('Answer Updated Successfully');

//           res.status(200).json({ message: "Answers Updated Successfully", errorCode: 1 });
//         }
//       });
//     });
//   } catch (error) {
//     logger.error(`Error in /controller/report/updateAnswer: ${err.message}`);
//     res.send(error);
//   }
// };

exports.updateAnswer = (req, res) => {
  const { dataArray } = req.body;
  const moment = require('moment');
  const currentDateTime = moment().format('YYYY-MM-DD HH:mm:ss');

  db.beginTransaction((err) => {
    if (err) {
      console.error("Transaction Start Error:", err);
      return res.status(500).json({
        errorCode: "INTERNAL_SERVER_ERROR",
        errorDetail: err,
        status: "ERROR",
        message: "Transaction start failed"
      });
    }

    let completed = 0;
    let hasErrorOccurred = false;

    dataArray.forEach((data, index) => {
      const { rqid, crid, brand_id, value,other_brands,brand_count,other_brand_count } = data;

      const updateQuery = `
        UPDATE question_camp_rep_mapping
        SET answer = ?, brand_id = ?, other_brands = ?,brand_count=?,other_brand_count=?
        WHERE crid = ? AND rqid = ?;
      `;

      db.query(updateQuery, [value, brand_id,other_brands,brand_count,other_brand_count, crid, rqid], (err, result) => {
        if (hasErrorOccurred) return;

        if (err) {
          hasErrorOccurred = true;
          console.error("Query Error:", err);
          return db.rollback(() => {
            res.status(500).json({
              errorCode: "INTERNAL_SERVER_ERROR",
              errorDetail: err,
              status: "ERROR",
              message: "Query execution failed"
            });
          });
        }

        completed++;

        if (completed === dataArray.length) {
          db.commit((err) => {
            if (err) {
              return db.rollback(() => {
                console.error("Commit Error:", err);
                res.status(500).json({
                  errorCode: "INTERNAL_SERVER_ERROR",
                  errorDetail: err,
                  status: "ERROR",
                  message: "Transaction commit failed"
                });
              });
            }

            res.status(200).json({
              message: "Answers Updated Successfully",
              errorCode: 1
            });
          });
        }
      });
    });
  });
};

exports.getAnswerWithId = async (req, res) => {
  const {crId} = req.body;
const query = `
SELECT
    rqid,
    answer,
    other_brands,
    brand_count,
    other_brand_count,
    GROUP_CONCAT(basic_mst.basic_id) AS brand_id,
    GROUP_CONCAT(basic_mst.description) AS description
FROM
    question_camp_rep_mapping
    LEFT JOIN basic_mst ON FIND_IN_SET(basic_mst.basic_id, question_camp_rep_mapping.brand_id)
WHERE
    question_camp_rep_mapping.crid = ?
    AND question_camp_rep_mapping.status = 'Y'
GROUP BY
    rqid, answer, other_brands,brand_count,other_brand_count;
`;
 
  try {
    db.query(query,[crId],(err, result) => {
      if (err) {
        logger.error(`Error in /controller/report/getAnswerWithId: ${err.message}`);

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
        res.status(200).json({message:"answer get successfully",errorCode: 1, data:result})
      } 
    });
  } catch (error) {
     logger.error(`Error in /controller/report/getAnswerWithId: ${error.message}`);
    res.send(error)
  }
}; 


// exports.updateAnswer = async (req, res) => {
//   const { dataArray } = req.body;

//       for (const data of dataArray) {
//         const { rqid,crid, brand_id, value, user_id } = data;
//         const currentDateTime = moment().format('YYYY-MM-DD HH:mm:ss');
//         // Update the row where crid = 1 for each data item
//         const updateQuery = `
//           UPDATE question_camp_rep_mapping
//           SET answer = ?, brand_id = ?, modified_by = ?, modified_date = ?
//           WHERE crid = ? AND rqid = ?;
//         `;
       
//         try {
//           db.query(updateQuery, [value, brand_id, user_id, currentDateTime, crid, rqid], (err, result) => {
//             if (err) {
//               res.status(500).json({
//                 errorCode: "INTERNAL_SERVER_ERROR",
//                 errorDetail: err,
//                 responseData: {},
//                 status: "ERROR",
//                 details: "An internal server error occurred",
//                 getMessageInfo: "An internal server error occurred"
//               });
//             } else {
//               res.status(200).json({ message: "Answers Added Successfully",errorCode:"1" });
//             } 
//           });
//         } catch (error) {
//           res.send(error);
//         }

//       }

     
// };



exports.getAllCampReport = async (req, res) => {
   
   const {userId,subCatId} = req.body;

  const query = `SELECT crid, doctor_name,code
    FROM camp_report_mst
    WHERE user_id = ? AND subcat_id = ? AND status='Y' order by camp_report_mst.crid desc;`

  //const query = 'CALL GetAllCampReport(?,?)'
  try {
    db.query(query,[userId,subCatId],(err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/getAllCampReport: ${err.message}`);
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
        res.status(200).json({message:"camp report get successfully",errorCode:1,data:result})
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/getAllCampReport: ${err.message}`);

    res.send(error)
  }
};

exports.getReportWithId = async (req, res) => {
   
  const {userId,subCatId} = req.body;
 //const query = 'select crid,doctor_name,camp_date from camp_report_mst where user_id=? and subcat_id =?'
 try {
   db.query(query,[userId,subCatId],(err, result) => {
     if (err) {
      logger.error(err.message);

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
       res.status(200).json(result)
     } 
   });
 } catch (error) {
  logger.error(error.message);

   res.send(error)
 }
};


// get brand name with id 


exports.getBrandWithId = async (req, res) => {
   
  const {subCatId} = req.body;

 const query = 'select basic_id,description from basic_mst where status = "Y"'
 //const query = 'CALL GetBrandName(?)'
 try {
   db.query(query,(err, result) => {
     if (err) {
    logger.error(`Error in /controller/report/getBrandWithId: ${err.message}`);
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
       res.status(200).json({message:"Brand list get successfully",errorCode:1,data:result})
     } 
   });
 } catch (error) {
 logger.error(`Error in /controller/report/getBrandWithId: ${error.message}`);

   res.send(error)
 }
};

// working
//  exports.deleteReportWithId = async (req, res) => {
//     const {crId} = req.body;  

//     const query = 'delete from camp_report_mst where crid=?'
//     // const query = 'CALL DeleteDoctor(?)'
//     try {
//       db.query(query, [crId], (err, result) => {
//         if (err) {
//         logger.error(err.message);

//           res.status(500).json({
//             errorCode: "0",
//             errorDetail: err.message,
//             responseData: {},
//             status: "ERROR",
//             details: "An internal server error occurred",
//             getMessageInfo: "An internal server error occurred"
//           });
//         }
//         else{
//         logger.info('Report deleted successfully');

//           res.status(200).json({ message: "Report Deleted Successfully",errorCode: "1"})
//         } 
//       });
//     } catch (error) {
//       logger.error(error.message);

//       res.send(error)
//     }
//   };

exports.deleteReportWithId = async (req, res) => {
  const { crId } = req.body;  

  const query1 = "UPDATE camp_report_mst SET status = 'N' WHERE crid = ?";
  const query2 = "UPDATE question_camp_rep_mapping SET status = 'N' WHERE crid = ?";
  const query3 = "UPDATE camp_report_img_mst SET status = 'N' WHERE crid = ?";
  const query4 = "UPDATE patient_mst SET status = 'N' WHERE crid = ?";

  try {
      await Promise.all([
          new Promise((resolve, reject) => {
              db.query(query1, [crId], (err, result) => {
                  if (err) reject(err);
                  else resolve(result);
              });
          }),
          new Promise((resolve, reject) => {
              db.query(query2, [crId], (err, result) => {
                  if (err) reject(err);
                  else resolve(result);
              });
          }),
          new Promise((resolve, reject) => {
              db.query(query3, [crId], (err, result) => {
                  if (err) reject(err);
                  else resolve(result);
              });
          }),
          new Promise((resolve, reject) => {
              db.query(query4, [crId], (err, result) => {
                  if (err) reject(err);
                  else resolve(result);
              });
          }),
      ]);

      res.status(200).json({ message: "Report Deleted Successfully", errorCode: 1 });
  } catch (error) {
     logger.error(`Error in /controller/report/deleteReportWithId: ${error.message}`);
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



// exports.deleteReportWithId = async (req, res) => {
//   const { crId } = req.body;

//   // Step 1: Retrieve the image file names associated with the report from the database
//   const queryGetImageFileNames = 'SELECT imgpath FROM camp_report_img_mst WHERE crid = ?';

//   try {
//     db.query(queryGetImageFileNames, [crId], (err, result) => {
//       if (err) {
//         logger.error(err.message);

//         res.status(500).json({
//           errorCode: "0",
//           errorDetail: err.message,
//           responseData: {},
//           status: "ERROR",
//           details: "An internal server error occurred",
//           getMessageInfo: "An internal server error occurred"
//         });
//       } else {
//         if (result.length === 0) {
//           // Report not found
//           res.status(404).json({ message: "Report not found", errorCode: "0" });
//         } else {

//           console.log("selecting images",result[0].imgpath)
//           const images = result;

//           // Step 2: Delete the report's data from the database
//           //const queryDeleteReport = 'DELETE FROM camp_report_mst WHERE crid = ?';

//           db.query(queryDeleteReport, [crId], (deleteErr, deleteResult) => {
//             if (deleteErr) {
//               logger.error(deleteErr.message);

//               res.status(500).json({
//                 errorCode: "0",
//                 errorDetail: deleteErr.message,
//                 responseData: {},
//                 status: "ERROR",
//                 details: "An internal server error occurred",
//                 getMessageInfo: "An internal server error occurred"
//               });
//             } else {
//               logger.info('Report Deleted Successfully');

//               // Step 3: Delete the image files from the file system if they exist
//               deleteImagesFromFileSystem(images);

//               res.status(200).json({ message: "Report Deleted Successfully", errorCode: "1" });
//             }
//           });
//         }
//       }
//     });
//   } catch (error) {
//     logger.error(error.message);

//     res.send(error);
//   }
// };

// function deleteImagesFromFileSystem(imageFileNames) {
//   // Specify the directory where the images are stored
//   const imageDirectory = 'your-image-directory';

//   // Loop through the array of image file names and delete each one
//   imageFileNames.forEach((imageName) => {
//     fs.unlink(`./uploads/report/${imageName.imgpath}`, (unlinkErr) => {
//       if (unlinkErr) {
//         console.error('Error deleting image: ', unlinkErr);
//       }
//       res.status(200).json({ message: 'Doctor data and image deleted successfully' });
//     });
//   });
// }





exports.deleteSingalReportImg = async (req, res) => {
  const {crimgid} = req.body;  

  const getImgFileName = 'select imgpath from camp_report_img_mst where crimgid = ?'
  //const query = 'delete from camp_report_img_mst where crimgid=?'

  try {
    db.query(getImgFileName, [crimgid], (err, result) => {
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

        if(result.length===0){
          res.status(404).json({ message: "img not found", errorCode: "0" });
        }
        else{
          let imageFileName = result[0].imgpath;
           const query = 'delete from camp_report_img_mst where crimgid=?'
  
            db.query(query, [crimgid], (deleteErr, deleteResult) => {
              if (deleteErr) {
                logger.error(deleteErr.message);
  
                res.status(500).json({
                  errorCode: "0",
                  errorDetail: deleteErr.message,
                  responseData: {},
                  status: "ERROR",
                  details: "An internal server error occurred",
                  getMessageInfo: "An internal server error occurred"
                });
              } else {
                logger.info('Image Delete Successfully');
                fs.unlink(`./uploads/report/${imageFileName}`, (unlinkErr) => {
                  if (unlinkErr) {
                    console.error('Error deleting image: ', unlinkErr);
                  }
                });
             

                res.status(200).json({ message: "Image Deleted Successfully",errorCode: "1"})
              }
            });
        }
      
      } 
    });
  } catch (error) {
    logger.error(error.message);

    res.send(error)
  }
};


  exports.getEmpData = async (req, res) => {
    const {empcode} = req.body;
     const query = 'select user_mst1.user_id,user_mst1.role,user_mst1.name,user_mst1.empcode,user_mst1.hq,user_mst1.reporting, role_mst.rolename from user_mst1 INNER JOIN role_mst on user_mst1.role = role_mst.role_id where user_mst1.reporting= ? and user_mst1.status = "Y"'
     
       try {
         db.query(query,[empcode],(err, result) => {
           if (err) {
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
         res.send(error)
       }
     };

     exports.getEmpDataWithId = async (req, res) => {
      const {userId} = req.body;
       const query = 'select user_id,name,empcode,hq,reporting from user_mst1 where user_id = ? and user_mst1.status = "Y"'
       
         try {
           db.query(query,[userId],(err, result) => {
             if (err) {
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
           res.send(error)
         }
       };

       
       exports.findDoctorReportPresent = async (req, res) => {
        const {name,date,empcode} = req.body;
        const formattedCampDate = moment(date, 'DD-MM-YYYY').format('YYYY-MM-DD');
        const query = 'SELECT crid FROM camp_report_mst WHERE doctor_name = ? and camp_date =? and user_empcode =? and status = "Y"';
     
        try {
          db.query(query,[name,formattedCampDate,empcode],(err, result) => {
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
              
              res.status(200).json({ message: "Doctor find Successfully",errorCode: "0"
            })
            } 
          });
        } catch (error) {
          logger.error(error.message);
    
          res.send(error)
        }
      };


      exports.getEditEmpData = async (req, res) => {
        const {empcode,repocode} = req.body;
        const query = `
         select um.user_id,um.name, um.empcode,um.hq,um.reporting, rm.rolename,um.role, um1.empcode as empcode1,um1.name as name1,um1.reporting as reporting1,um1.role as role1 , um2.empcode as empcode2,um2.name as name2,um2.reporting as reporting2,um2.role as role1, um3.empcode as empcode3,um3.name as name3,um3.reporting as reporting3,um3.role as role1, um4.empcode as empcode4,um4.name as name4,um4.reporting as reporting4,um4.role as role1, um5.empcode as empcode5,um5.name as name5,um5.reporting as reporting5,um5.role as role1 from user_mst1 um INNER JOIN role_mst rm on um.role = rm.role_id and um.reporting= ? AND um.empcode= ? inner join user_mst1 um1 on um.reporting=um1.empcode inner join user_mst1 um2 on um1.reporting=um2.empcode inner join user_mst1 um3 on um2.reporting=um3.empcode LEFT join user_mst1 um4 on um3.reporting=um4.empcode LEFT join user_mst1 um5 on um4.reporting=um5.empcode;`
           try {
             db.query(query,[repocode,empcode],(err, result) => {
               if (err) {
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
                console.log(result)
                 res.status(200).json(result)
               } 
             });
           } catch (error) {
             res.send(error)
           }
         };


exports.addPatients = async (req, res) => {  
  
  const {userId,subCatId,crId,name,age,gender,bp,sbp,dbp,isHypertensive,tc,tg,hdl,nonhdl,ldl,ldlhdl,heartRate,fibrillation} = req.body;
  const query = `insert into patient_mst 
  (crid,subcat_id,name,age,gender,bp,sbp,dbp,isHypertensive,tc,tg,hdl,nonhdl,ldl,ldlhdl,heart_rate,fibrillation,created_by) 
  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
  try {
    db.query(query, [crId,subCatId,name,age,gender,bp,sbp,dbp,isHypertensive,tc,tg,hdl,nonhdl,ldl,ldlhdl,heartRate,fibrillation,userId], (err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/addPatients: ${err.message}`);
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
        res.status(200).json({ message: "Patients Added Successfully",errorCode:1})
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/addPatients: ${error.message}`);
    res.send(error)
  }
}; 

exports.updatePatients = async (req, res) => {  
  
  const {patientId,name,age,gender,bp,sbp,dbp,isHypertensive,tc,tg,hdl,nonhdl,ldl,ldlhdl,heartRate,fibrillation} = req.body;
   const query = 'CALL UpdatePatient(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
  try {
    db.query(query, [patientId,name,age,gender,bp,sbp,dbp,isHypertensive,tc,tg,hdl,nonhdl,ldl,ldlhdl,heartRate,fibrillation], (err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/updatePatients: ${err.message}`);
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
        res.status(200).json({ message: "Patients updated Successfully",errorCode:1})
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/updatePatients: ${error.message}`);
    res.send(error)
  }
};   

exports.deletePatients = async (req, res) => {  
  
  const {patientId} = req.body;
   const query = 'update patient_mst set status = "N" where pa_id = ?'
  try {
    db.query(query, [patientId], (err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/deletePatients: ${err.message}`);
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
        res.status(200).json({ message: "Patients deleted Successfully",errorCode:1})
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/deletePatients: ${error.message}`);
    res.send(error)
  }
}; 


exports.getPatientsInfoWithId = async (req, res) => {  
  
  const {patientId} = req.body;
  const query = `select 
  pa_id,crid,subcat_id,name,age,gender,bp,sbp,dbp,isHypertensive,tc,tg,hdl,nonhdl,ldl,ldlhdl,heart_rate,fibrillation,created_by
  from patient_mst where pa_id = ? 
  `;
  try {
    db.query(query, [patientId], (err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/getPatientsInfoWithId: ${err.message}`);
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
        res.status(200).json({ message: "Patient get Successfully",errorCode:1,data:result})
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/getPatientsInfoWithId: ${error.message}`);
    res.send(error)
  }
}; 


exports.getPatientsList = async (req, res) => {  
  
  const {crId,subCatId,userId} = req.body;
  const query = `select 
  pa_id,crid,subcat_id,name,age,gender,bp,sbp,dbp,isHypertensive,tc,tg,hdl,nonhdl,ldl,ldlhdl,heart_rate,fibrillation,created_by
  from patient_mst where crid = ? and subcat_id = ? and created_by = ? and status = "Y"
  `;
  try {
    db.query(query, [crId,subCatId,userId], (err, result) => {
      if (err) {
       logger.error(`Error in /controller/report/getPatientsList: ${err.message}`);
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
        res.status(200).json({ message: "Patient get Successfully",errorCode:1,data:result})
      } 
    });
  } catch (error) {
    logger.error(`Error in /controller/report/getPatientsList: ${error.message}`);
    res.send(error)
  }
}; 