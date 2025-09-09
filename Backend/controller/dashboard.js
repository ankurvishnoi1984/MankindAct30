const db = require("../config/db");
const json2csv = require('json2csv').Parser;
const moment = require('moment');
const logger = require('../utils/logger')
const fs = require('fs');
const path = require('path');
const { Parser } = require('json2csv');
const XLSX = require('xlsx');


// exports.totalDoctor = async (req, res) => {
//   const {userId} = req.body
  
//   const query = "SELECT COUNT(*) as doctor_count FROM doctor_mst WHERE user_id=?;";
//   //const query =  'CALL GetTotalDoctorCount(?)';
//   try {
//     db.query(query,[userId], (err, result) => {
//       if (err) {
//         logger.error(err.message);
//         res.status(500).json({
//           errorCode: "0",
//           errorDetail: err.message,
//           responseData: {},
//           status: "ERROR",
//           details: "An internal server error occurred",
//           getMessageInfo: "An internal server error occurred",
//         });
//       } else {
//         logger.info('Fetched total doctors');
//         res.status(200).json(result[0]);
//       }
//     });
//   } catch (error) {
//     logger.error(error.message);
//     res.json(error);
//   }
// };


// exports.totalCamps = async (req, res) => {
//     const query = "SELECT COUNT(*) as camp_count FROM doctor_camp_mapping where user_id =?";
//     const {userId} = req.body
//   //const query = 'CALL GetTotalCampCount(?)';

//     try {
//       db.query(query,[userId], (err, result) => {
//         if (err) {
//         logger.error(err.message);

//           res.status(500).json({
//             errorCode: "0",
//             errorDetail: err.message,
//             responseData: {},
//             status: "ERROR",
//             details: "An internal server error occurred",
//             getMessageInfo: "An internal server error occurred",
//           });
//         } else {
//         logger.info('Fetched total Camps');

//           res.status(200).json(result[0]);
//         }
//       });
//     } catch (error) {
//       logger.error(error.message);

//       res.json(error);
//     }
//   };

exports.getTotalDoctorAndCampCount = (req, res) => {
  const { userId } = req.body;

  const doctorQuery = "SELECT COUNT(*) as doctor_count FROM camp_report_mst WHERE user_id = ? and status='Y'";
  const campQuery = "SELECT COUNT(*) as camp_count FROM camp_report_mst WHERE user_id = ? and status='Y'";

  db.query(doctorQuery, [userId], (err, doctorResult) => {
    if (err) {
      logger.error("Doctor Count Error: " + err.message);
      return res.status(500).json({
        errorCode: "0",
        errorDetail: err.message,
        responseData: {},
        status: "ERROR",
        details: "Error fetching doctor count",
        getMessageInfo: "Internal error while fetching doctor data"
      });
    }

    db.query(campQuery, [userId], (err, campResult) => {
      if (err) {
        logger.error("Camp Count Error: " + err.message);
        return res.status(500).json({
          errorCode: "0",
          errorDetail: err.message,
          responseData: {},
          status: "ERROR",
          details: "Error fetching camp count",
          getMessageInfo: "Internal error while fetching camp data"
        });
      }

      return res.status(200).json({
        doctor_count: doctorResult[0].doctor_count,
        camp_count: campResult[0].camp_count,
        message:"dashboard count get successfully",
        errorCode: 1
      });
    });
  });
};




  exports.totalCampsWithSubCatId = async (req, res) => {
    const { subCatId, userId } = req.body;
    //const query = "SELECT COUNT(*) as camp_count FROM doctor_camp_mapping WHERE subcat_id =?";
    const query = 'CALL GetTotalCampsWithSubCatId(?,?)';
    try {
      db.query(query,[subCatId,userId] ,(err, result) => {
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
        logger.info('Fetched total Camps with respect to user');

          res.status(200).json(result[0]);
        }
      });
    } catch (error) {
      logger.error(error.message);

      res.json(error);
    }
  };


  exports.totalPaScreened = async (req, res) => {
    const { subCatId, userId } = req.body;
   
    //const query = 'SELECT SUM(answer) as screened_count FROM question_camp_rep_mapping WHERE rqid=1 AND subcat_id=? and created_by=?;'
   const query = 'CALL GetTotalPaScreened(?,?)'
    try {
      db.query(query,[subCatId,userId] ,(err, result) => {
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
          logger.info('Fetched total patient screened');

          res.status(200).json(result[0]);
        }
      });
    } catch (error) {
      logger.error(error.message);

      res.json(error);
    }
  };


  exports.totalPaDiagnosed = async (req, res) => {
    const { subCatId, userId } = req.body;
    //const query = 'SELECT SUM(answer) as diagnosed_count FROM question_camp_rep_mapping WHERE rqid=2 AND subcat_id=?;'
     
    const query = 'CALL GetTotalPaDiagnosed(?,?)'
    try {
      db.query(query,[subCatId,userId] ,(err, result) => {
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
        logger.info('Fetched total patients diagnosed');

          res.status(200).json(result[0]);
        }
      });
    } catch (error) {
      logger.error(error.message);

      res.json(error);
    }
  };





  // exports.getFilterCampReportCsv = async (req, res) => {
  //   const id = req.params.id
  //   const query =
  //     'SELECT camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE camp_report_mst.crid=?';
  
  //   try {
  //     db.query(query,[id], (err, result) => {
  //       if (err) {
  //         res.status(500).json({
  //           errorCode: 'INTERNAL_SERVER_ERROR',
  //           errorDetail: err.message,
  //           responseData: {},
  //           status: 'ERROR',
  //           details: 'An internal server error occurred',
  //           getMessageInfo: 'An internal server error occurred',
  //         });
  //       } else {
  //         // Create an object to store the transformed data
  //         const transformedData = {};
  
  //         // Loop through the result to group by doctor_name and camp_date
  //         result.forEach((row) => {
  //           const { doctor_name, camp_date,created_date, rqid, answer } = row;
  //           if (!transformedData[doctor_name]) {
  //             transformedData[doctor_name] = {
  //               doctor_name,
  //               camp_date,
  //               created_date,
  //               question: [],
  //             };
  //           }
  
  //           // Add the question object to the question array
  //           transformedData[doctor_name].question.push({ rqid, answer });
  //         });
  
  //         // Convert the object values into an array
  //         const transformedArray = Object.values(transformedData);
  
  //         res.status(200).json(transformedArray);
  //       }
  //     });
  //   } catch (error) {
  //     res.json(error);
  //   }
  // };
  


// exports.getFilterCampReportCsv = async (req, res) => {
//   const id = req.params.id;
//   const query =
//     'SELECT camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE camp_report_mst.crid=?';

//   try {
//     db.query(query, [id], (err, result) => {
//       if (err) {
//         res.status(500).json({
//           errorCode: 'INTERNAL_SERVER_ERROR',
//           errorDetail: err.message,
//           responseData: {},
//           status: 'ERROR',
//           details: 'An internal server error occurred',
//           getMessageInfo: 'An internal server error occurred',
//         });
//       } else {
//         // Create an object to store the transformed data
//         const transformedData = {};

//         // Loop through the result to group by doctor_name and camp_date
//         result.forEach((row) => {
//           const { doctor_name, camp_date, created_date, rqid, answer } = row;
//           if (!transformedData[doctor_name]) {
//             transformedData[doctor_name] = {
//               doctor_name,
//               camp_date,
//               created_date,
//               question: [],
//             };
//           }

//           // Add the answer to the question array
//           transformedData[doctor_name].question.push(answer);
//         });

//         // Convert the object values into an array
//         const transformedArray = Object.values(transformedData);

//         // Define the fields for CSV columns
//         const fields = ['Doctor Name', 'Camp Date', 'CampCreatedDate', 'No of Patient Screened ', 'No of Patient Diagnosed', 'No of Prescription Generated'];

//         // Create a JSON to CSV parser
//         const json2csvParser = new json2csv({ fields });

//         // Convert the data to CSV format
//         const csv = json2csvParser.parse(transformedArray);

//         // Set the response headers for CSV download
//         res.header('Content-Type', 'text/csv');
//         res.attachment('camp_report.csv');

//         // Send the CSV data as the response
//         res.status(200).send(csv);
//       }
//     });
//   } catch (error) {
//     res.json(error);
//   }
// };

// exports.getFilterCampReportCsvWithId = async (req, res) => {
//   const {crid} = req.query
// // const query =
// //  'SELECT camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE camp_report_mst.crid=?';
// // working  const query = 'SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer,question_camp_rep_mapping.brand_id FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE camp_report_mst.crid=?;'
// // const query = 'CALL GetCampReportCsv(?,?)'

// const query = `SELECT
// crid,
// doctor_name,
// camp_date,
// created_date,
// rqid,
// answer,
// brand_id,
// GROUP_CONCAT(DISTINCT description) AS description
// FROM (
// SELECT
//     camp_report_mst.crid,
//     camp_report_mst.doctor_name,
//     camp_report_mst.camp_date,
//     camp_report_mst.created_date,
//     question_camp_rep_mapping.rqid,
//     question_camp_rep_mapping.answer,
//     question_camp_rep_mapping.brand_id,
//     basic_mst.description
// FROM
//     camp_report_mst
// INNER JOIN
//     question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid
// INNER JOIN
//     basic_mst ON FIND_IN_SET(basic_mst.basic_id, question_camp_rep_mapping.brand_id)
// WHERE
//     camp_report_mst.crid = ?
// ) AS subquery
// GROUP BY
// crid, doctor_name, camp_date, created_date, rqid, answer, brand_id;
// `
// try {
//   db.query(query, [crid], (err, result) => {
//     if (err) {
//       logger.error(err.message);

//       res.status(500).json({
//         errorCode: '0',
//         errorDetail: err.message,
//         responseData: {},
//         status: 'ERROR',
//         details: 'An internal server error occurred',
//         getMessageInfo: 'An internal server error occurred',
//       });
//     } else {
//       // Create an object to store the transformed data
//       const transformedData = {};
//       console.log("for brand id",result)   
//       // Loop through the result to group by doctor_name and camp_date
//       result.forEach((row) => {
//         const { doctor_name, camp_date, created_date, rqid, answer,description } = row;

//         const formattedDate = moment(created_date).format('DD-MM-YYYY hh:mm:ss a');
//         const formattedDate2 = moment(camp_date).format('DD-MM-YYYY hh:mm:ss a');
//         if (!transformedData[doctor_name]) {
//           transformedData[doctor_name] = {
//             'Doctor Name': doctor_name,
//             'Camp Date': formattedDate2,
//             'Camp Created Date': formattedDate,
//             'Brand Name': description,
//             'No of Patient Screened': 0,
//             'No of Patient Diagnosed': 0,
//             'No of Prescription Generated': 0,
//           };
//         }

//         // Add the answer to the corresponding field
//         if (rqid == 1 || rqid == 4 ||rqid == 7 ||rqid == 10 ||rqid == 13 ) {
//           transformedData[doctor_name]['No of Patient Screened'] = answer;
//         } else if (rqid === 2 || rqid === 5 || rqid === 8 || rqid === 11 || rqid === 15) {
//           transformedData[doctor_name]['No of Patient Diagnosed'] = answer;
//         } else if (rqid === 3 || rqid === 6 || rqid === 9 || rqid === 12 || rqid === 16) {
//           transformedData[doctor_name]['No of Prescription Generated'] = answer;
//         }


        
//       });

//       // Convert the object values into an array
//       console.log(transformedData);
//       const transformedArray = Object.values(transformedData);
      
//       // Define the fields for CSV columns
//       const fields = ['Doctor Name', 'Camp Date', 'Camp Created Date', 'Brand Name', 'No of Patient Screened', 'No of Patient Diagnosed', 'No of Prescription Generated'];

//       // Create a JSON to CSV parser
//       const json2csvParser = new json2csv({ fields });

//       // Convert the data to CSV format
//       const csv = json2csvParser.parse(transformedArray);

//       // Set the response headers for CSV download
//       res.header('Content-Type', 'text/csv');
//       res.attachment('camp_report.csv');

//       // Send the CSV data as the response
//       res.status(200).send(csv);
//     }
//   });
// } catch (error) {
//   logger.error(error.message);

//   res.json(error);
// }
// };


// usings this
// exports.getFilterCampReportCsv = async (req, res) => {
//     const {userId,subCatId} = req.query
//  // const query =
//   //  'SELECT camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE camp_report_mst.crid=?';
//    const query = 'SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer,question_camp_rep_mapping.brand_id FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE question_camp_rep_mapping.subcat_id=? and question_camp_rep_mapping.created_by=?;'
//   // const query = 'CALL GetCampReportCsv(?,?)'
//   try {
//     db.query(query, [subCatId,userId], (err, result) => {
//       if (err) {
//         logger.error(err.message);

//         res.status(500).json({
//           errorCode: '0',
//           errorDetail: err.message,
//           responseData: {},
//           status: 'ERROR',
//           details: 'An internal server error occurred',
//           getMessageInfo: 'An internal server error occurred',
//         });
//       } else {
//         // Create an object to store the transformed data
//         const transformedData = {};

//         // Loop through the result to group by doctor_name and camp_date
//         result.forEach((row) => {
//           const { doctor_name, camp_date, created_date, rqid, answer } = row;

//           const formattedDate = moment(created_date).format('DD-MM-YYYY hh:mm:ss a');
//           const formattedDate2 = moment(camp_date).format('DD-MM-YYYY hh:mm:ss a');
//           if (!transformedData[doctor_name]) {
//             transformedData[doctor_name] = {
//               'Doctor Name': doctor_name,
//               'Camp Date': formattedDate2,
//               'Camp Created Date': formattedDate,
//               'No of Patient Screened': 0,
//               'No of Patient Diagnosed': 0,
//               'No of Prescription Generated': 0,
//             };
//           }

//           // Add the answer to the corresponding field
//           if (rqid === 1) {
//             transformedData[doctor_name]['No of Patient Screened'] = answer;
//           } else if (rqid === 2) {
//             transformedData[doctor_name]['No of Patient Diagnosed'] = answer;
//           } else if (rqid === 3) {
//             transformedData[doctor_name]['No of Prescription Generated'] = answer;
//           }
//         });

//         // Convert the object values into an array
//         const transformedArray = Object.values(transformedData);
        
//         // Define the fields for CSV columns
//         const fields = ['Doctor Name', 'Camp Date', 'Camp Created Date', 'No of Patient Screened', 'No of Patient Diagnosed', 'No of Prescription Generated'];

//         // Create a JSON to CSV parser
//         const json2csvParser = new json2csv({ fields });

//         // Convert the data to CSV format
//         const csv = json2csvParser.parse(transformedArray);

//         // Set the response headers for CSV download
//         res.header('Content-Type', 'text/csv');
//         res.attachment('camp_report.csv');

//         // Send the CSV data as the response
//         res.status(200).send(csv);
//       }
//     });
//   } catch (error) {
//     logger.error(error.message);

//     res.json(error);
//   }
// };

// working code
exports.getFilterCampReportCsv = async (req, res) => {
  const { userId, subCatId, startDate, endDate, filterBy, empcode } = req.body;


  // Enhanced query with patient details and brand bifurcation similar to getReportDetailed
  const query = `
    SELECT
        camp_report_mst.crid,
        camp_report_mst.doctor_name,
        camp_report_mst.code,
        camp_report_mst.created_date,
        camp_report_mst.camp_date,
       
        /* Question responses */
        question_camp_rep_mapping.rqid,
     GROUP_CONCAT(DISTINCT question_camp_rep_mapping.answer) AS answers,


       
        /* Brand information */
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.brand_id), '') AS brand_id,
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.brand_count), '') AS brand_count,
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.other_brands), '') AS other_brands,
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.other_brand_count), '') AS other_brand_count,
       
        /* Brand names (comma separated) */
        COALESCE(
          GROUP_CONCAT(
            DISTINCT basic_mst.description ORDER BY basic_mst.description SEPARATOR ', '
          ),
          'N/A'
        ) AS brand_names,
       
        /* Patient details */
        p.pa_id,
        p.subcat_id AS patient_subcat_id,
        p.name AS patient_name,
        p.age,
        p.gender,
        p.bp,
        p.sbp,
        p.dbp,
        p.isHypertensive,
        p.tc,
        p.tg,
        p.nonhdl,
        p.hdl,
        p.ldl,
        p.ldlhdl,
        p.heart_rate,
        p.fibrillation,
        p.created_date AS patient_created_date
 
 
    FROM camp_report_mst
    INNER JOIN question_camp_rep_mapping
      ON camp_report_mst.crid = question_camp_rep_mapping.crid
    LEFT JOIN basic_mst
      ON FIND_IN_SET(basic_mst.basic_id, question_camp_rep_mapping.brand_id) > 0
    /* Add patient details */
    LEFT JOIN patient_mst p
      ON p.crid = camp_report_mst.crid
   
    WHERE question_camp_rep_mapping.subcat_id = ?
      AND question_camp_rep_mapping.created_by = ?
      AND camp_report_mst.status = 'Y'
      AND question_camp_rep_mapping.status = 'Y'
   
    GROUP BY camp_report_mst.crid, question_camp_rep_mapping.rqid, p.pa_id
    ORDER BY camp_report_mst.created_date DESC
  `;


  try {
    db.query(query, [subCatId, userId], (err, result) => {
      if (err) {
        logger.error(err.message);
        res.status(500).json({
          errorCode: 'INTERNAL_SERVER_ERROR',
          errorDetail: err.message,
          responseData: {},
          status: 'ERROR',
          details: 'An internal server error occurred',
          getMessageInfo: 'An internal server error occurred',
        });
      } else {
        // Create an object to store the transformed data
        const transformedData = {};


        // Loop through the result to group by doctor_name and process data
        result.forEach((row) => {
          const {
            crid, doctor_name, code, created_date, camp_date, rqid, answer,
            brand_id, brand_count, other_brands, other_brand_count, brand_names,
            pa_id, patient_name, age, gender, bp, sbp, dbp, isHypertensive,
            tc, tg, nonhdl, hdl, ldl, ldlhdl, heart_rate, fibrillation,
            patient_created_date
          } = row;


          console.log("row data", row);


          // Create unique key for each camp report
          const uniqueKey = `${doctor_name}_${code}_${crid}`;


          if (!transformedData[uniqueKey]) {
            // Brand bifurcation logic similar to getReportDetailed
            const brandIds = brand_id ? brand_id.split(',') : [];
            const brandCounts = brand_count ? brand_count.split(',') : [];
            const brandNamesList = brand_names && brand_names !== 'N/A'
              ? brand_names.split(',').map((n) => n.trim())
              : [];


            // Initialize brand fields
            let brand_name1 = '', brand_count1 = 0;
            let brand_name2 = '', brand_count2 = 0;
            let brand_name3 = '', brand_count3 = 0;
            let brand_name4 = '', brand_count4 = 0;


            // Assign first 3 brands to individual fields
            brandNamesList.forEach((bn, i) => {
              const count = parseInt(brandCounts[i]) || 0;
              if (i === 0) {
                brand_name1 = bn;
                brand_count1 = count;
              } else if (i === 1) {
                brand_name2 = bn;
                brand_count2 = count;
              } else if (i === 2) {
                brand_name3 = bn;
                brand_count3 = count;
              } else {
                // Combine remaining brands in brand_name4
                if (brand_name4) {
                  brand_name4 += ', ' + bn;
                  brand_count4 += count;
                } else {
                  brand_name4 = bn;
                  brand_count4 = count;
                }
              }
            });


            // Combine brand names and other brands for the original Brand_Name field
            const allBrands = [
              ...(brand_names && brand_names !== 'N/A' ? brand_names.split(',').map(b => b.trim()) : []),
              ...(other_brands ? other_brands.split(',').map(b => b.trim()).filter(Boolean) : [])
            ];


            transformedData[uniqueKey] = {
              'Doctor_Name': doctor_name,
              'Code': code,
              'Camp_Created_Date': created_date,
              'Camp_Date': camp_date,




              // Original fields
              'No_of_Patient_Screened': 0,
              'No_of_Patient_Diagnosed': 0,
              'No_of_Rx_Generated': 0,


              // Brand bifurcation fields
              'Brand_Name_1': brand_name1,
              'Brand_Count_1': brand_count1,
              'Brand_Name_2': brand_name2,
              'Brand_Count_2': brand_count2,
              'Brand_Name_3': brand_name3,
              'Brand_Count_3': brand_count3,
              'Brand_Name_4': brand_name4,
              'Brand_Count_4': brand_count4,
              'Other_Brands': other_brands || '',
              'Other_Brand_Count': other_brand_count || '',


              // Patient details (will be arrays for multiple patients)
              'Patient_Names': [],
              'Patient_Ages': [],
              'Patient_Genders': [],
              'Patient_BP': [],
              'Patient_SBP': [],
              'Patient_DBP': [],
              'Patient_Hypertensive': [],
              'Patient_TC': [],
              'Patient_TG': [],
              'Patient_NONHDL': [],
              'Patient_HDL': [],
              'Patient_LDL': [],
              'Patient_LDLHDL': [],
              'Patient_Heart_Rate': [],
              'Patient_Fibrillation': [],
              'Patient_Created_Dates': []
            };
          }


          // Add patient data if exists
          if (pa_id && patient_name) {
            const patientKey = `${pa_id}_${patient_name}`;
            // Check if this patient is already added (to avoid duplicates)
            if (!transformedData[uniqueKey]['Patient_Names'].includes(patient_name) ||
              transformedData[uniqueKey]['Patient_Names'].length === 0) {


              transformedData[uniqueKey]['Patient_Names'].push(patient_name || '');
              transformedData[uniqueKey]['Patient_Ages'].push(age || '');
              transformedData[uniqueKey]['Patient_Genders'].push(gender || '');
              transformedData[uniqueKey]['Patient_BP'].push(bp || '');
              transformedData[uniqueKey]['Patient_SBP'].push(sbp || '');
              transformedData[uniqueKey]['Patient_DBP'].push(dbp || '');
              transformedData[uniqueKey]['Patient_Hypertensive'].push(isHypertensive || '');
              transformedData[uniqueKey]['Patient_TC'].push(tc || '');
              transformedData[uniqueKey]['Patient_TG'].push(tg || '');
              transformedData[uniqueKey]['Patient_NONHDL'].push(nonhdl || '');
              transformedData[uniqueKey]['Patient_HDL'].push(hdl || '');
              transformedData[uniqueKey]['Patient_LDL'].push(ldl || '');
              transformedData[uniqueKey]['Patient_LDLHDL'].push(ldlhdl || '');
              transformedData[uniqueKey]['Patient_Heart_Rate'].push(heart_rate || '');
              transformedData[uniqueKey]['Patient_Fibrillation'].push(fibrillation || '');
              transformedData[uniqueKey]['Patient_Created_Dates'].push(patient_created_date || '');
            }
          }


          // Add the answer to the corresponding field (keeping original logic)
          if (rqid == 1 || rqid == 4 || rqid == 7) {
            transformedData[uniqueKey]['No_of_Patient_Screened'] = Math.max(
              transformedData[uniqueKey]['No_of_Patient_Screened'],
              parseInt(answer) || 0
            );
          } else if (rqid === 2 || rqid === 5 || rqid === 8) {
            transformedData[uniqueKey]['No_of_Patient_Diagnosed'] = Math.max(
              transformedData[uniqueKey]['No_of_Patient_Diagnosed'],
              parseInt(answer) || 0
            );
          } else if (rqid === 3 || rqid === 6 || rqid === 9) {
            transformedData[uniqueKey]['No_of_Rx_Generated'] = Math.max(
              transformedData[uniqueKey]['No_of_Rx_Generated'],
              parseInt(answer) || 0
            );
          }
        });


        // Convert arrays to comma-separated strings for CSV export
        const transformedArray = Object.values(transformedData).map(item => ({
          ...item,
          'Patient_Names': item['Patient_Names'].join(', '),
          'Patient_Ages': item['Patient_Ages'].join(', '),
          'Patient_Genders': item['Patient_Genders'].join(', '),
          'Patient_BP': item['Patient_BP'].join(', '),
          'Patient_SBP': item['Patient_SBP'].join(', '),
          'Patient_DBP': item['Patient_DBP'].join(', '),
          'Patient_Hypertensive': item['Patient_Hypertensive'].join(', '),
          'Patient_TC': item['Patient_TC'].join(', '),
          'Patient_TG': item['Patient_TG'].join(', '),
          'Patient_NONHDL': item['Patient_NONHDL'].join(', '),
          'Patient_HDL': item['Patient_HDL'].join(', '),
          'Patient_LDL': item['Patient_LDL'].join(', '),
          'Patient_LDLHDL': item['Patient_LDLHDL'].join(', '),
          'Patient_Heart_Rate': item['Patient_Heart_Rate'].join(', '),
          'Patient_Fibrillation': item['Patient_Fibrillation'].join(', '),
          'Patient_Created_Dates': item['Patient_Created_Dates'].join(', ')
        }));



        // Apply different filters based on filterBy parameter (keeping original logic)
        let filteredData = [];


        if (filterBy === 'month') {
          const thirtyDaysAgo = new Date();
          thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);


          filteredData = transformedArray.filter((item) => {
            const itemDate = new Date(item.Camp_Created_Date);
            return (
              (!startDate || itemDate >= new Date(startDate)) &&
              (!endDate || itemDate <= new Date(endDate)) &&
              itemDate >= thirtyDaysAgo
            );
          });
        } else if (filterBy === 'week') {
          const sevenDaysAgo = new Date();
          sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);


          filteredData = transformedArray.filter((item) => {
            const itemDate = new Date(item.Camp_Created_Date);
            return (
              (!startDate || itemDate >= new Date(startDate)) &&
              (!endDate || itemDate <= new Date(endDate)) &&
              itemDate >= sevenDaysAgo
            );
          });
        } else {
          filteredData = transformedArray.filter((item) => {
            const itemDate = new Date(item.Camp_Created_Date);
            return (
              (!startDate || itemDate >= new Date(startDate)) &&
              (!endDate || itemDate <= new Date(endDate))
            );
          });
        }


        // Sort the filtered data by created_date (ascending)
        filteredData.sort((a, b) => new Date(a.Camp_Created_Date) - new Date(b.Camp_Created_Date));
        console.log("filterdata", filteredData);


        // const formattedResult = filteredData.map((item) => ({
        //   ...item,
        //   Camp_Created_Date: moment(item.Camp_Created_Date).format('DD-MM-YYYY'),
        //   Camp_Date: item.Camp_Date ? moment(item.Camp_Date).format('DD-MM-YYYY') : '',
        // }));
        const formattedResult = filteredData.map((item) => {
          const { Patient_Names,Patient_Created_Dates, ...rest } = item; // strip names out
          return {
            ...rest,
            Camp_Created_Date: moment(item.Camp_Created_Date).format('DD-MM-YYYY'),
            Camp_Date: item.Camp_Date ? moment(item.Camp_Date).format('DD-MM-YYYY') : '',
          };
        });


        const ws = XLSX.utils.json_to_sheet(formattedResult);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Camp Report');


        const buffer = XLSX.write(wb, { bookType: 'xlsx', type: 'buffer' });


        res.header('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        res.attachment('camp_report_detailed.xlsx');
        res.send(buffer);
      }
    });
  } catch (error) {
    logger.error(error.message);
    res.json(error);
  }
};


exports.getFilterCampReportCsvWithId = async (req, res) => {
  const { crId } = req.body;
 
 
  // Enhanced query with patient details and brand bifurcation similar to getReportDetailed
  const query = `
    SELECT
        camp_report_mst.crid,
        camp_report_mst.doctor_name,
        camp_report_mst.code,
        camp_report_mst.created_date,
        camp_report_mst.camp_date,
       
        /* Question responses */
        question_camp_rep_mapping.rqid,
      GROUP_CONCAT(DISTINCT question_camp_rep_mapping.answer) AS answers,
       
        /* Brand information */
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.brand_id), '') AS brand_id,
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.brand_count), '') AS brand_count,
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.other_brands), '') AS other_brands,
        COALESCE(GROUP_CONCAT(DISTINCT question_camp_rep_mapping.other_brand_count), '') AS other_brand_count,
       
        /* Brand names (comma separated) */
        COALESCE(
          GROUP_CONCAT(
            DISTINCT basic_mst.description ORDER BY basic_mst.description SEPARATOR ', '
          ),
          'N/A'
        ) AS brand_names,
       
        /* Patient details */
        p.pa_id,
        p.subcat_id AS patient_subcat_id,
        p.name AS patient_name,
        p.age,
        p.gender,
        p.bp,
        p.sbp,
        p.dbp,
        p.isHypertensive,
        p.tc,
        p.tg,
        p.nonhdl,
        p.hdl,
        p.ldl,
        p.ldlhdl,
        p.heart_rate,
        p.fibrillation,
        p.created_date AS patient_created_date
 
 
    FROM camp_report_mst
    INNER JOIN question_camp_rep_mapping
      ON camp_report_mst.crid = question_camp_rep_mapping.crid
    LEFT JOIN basic_mst
      ON FIND_IN_SET(basic_mst.basic_id, question_camp_rep_mapping.brand_id) > 0
    /* Add patient details */
    LEFT JOIN patient_mst p
      ON p.crid = camp_report_mst.crid
   
    WHERE camp_report_mst.crid = ?
      AND camp_report_mst.status = 'Y'
   
    GROUP BY camp_report_mst.crid, question_camp_rep_mapping.rqid, p.pa_id
    ORDER BY camp_report_mst.created_date DESC
  `;
 
 
  try {
    db.query(query, [crId], (err, result) => {
      if (err) {
        logger.error(err.message);
        res.status(500).json({
          errorCode: '0',
          errorDetail: err.message,
          responseData: {},
          status: 'ERROR',
          details: 'An internal server error occurred',
          getMessageInfo: 'An internal server error occurred',
        });
      } else {
        // Create an object to store the transformed data
        const transformedData = {};
        console.log("for brand id", result);
       
        // Loop through the result to group by doctor_name and process data
        result.forEach((row) => {
          const {
            crid, doctor_name, code, created_date, camp_date, rqid, answer,
            brand_id, brand_count, other_brands, other_brand_count, brand_names,
            pa_id, patient_name, age, gender, bp, sbp, dbp, isHypertensive,
            tc, tg, nonhdl, hdl, ldl, ldlhdl, heart_rate, fibrillation,
            patient_created_date
          } = row;
 
 
          const formattedDate = moment(created_date).format('DD-MM-YYYY hh:mm:ss a');
         
          // Create unique key for each camp report
          const uniqueKey = `${doctor_name}_${code}_${crid}`;
         
          if (!transformedData[uniqueKey]) {
            // Brand bifurcation logic similar to getReportDetailed
            const brandIds = brand_id ? brand_id.split(',') : [];
            const brandCounts = brand_count ? brand_count.split(',') : [];
            const brandNamesList = brand_names && brand_names !== 'N/A'
              ? brand_names.split(',').map((n) => n.trim())
              : [];
 
 
            // Initialize brand fields
            let brand_name1 = '', brand_count1 = 0;
            let brand_name2 = '', brand_count2 = 0;
            let brand_name3 = '', brand_count3 = 0;
            let brand_name4 = '', brand_count4 = 0;
 
 
            // Assign first 3 brands to individual fields
            brandNamesList.forEach((bn, i) => {
              const count = parseInt(brandCounts[i]) || 0;
              if (i === 0) {
                brand_name1 = bn;
                brand_count1 = count;
              } else if (i === 1) {
                brand_name2 = bn;
                brand_count2 = count;
              } else if (i === 2) {
                brand_name3 = bn;
                brand_count3 = count;
              } else {
                // Combine remaining brands in brand_name4
                if (brand_name4) {
                  brand_name4 += ', ' + bn;
                  brand_count4 += count;
                } else {
                  brand_name4 = bn;
                  brand_count4 = count;
                }
              }
            });
 
 
            // Combine brand names and other brands for the original Brand_Name field
            const allBrands = [
              ...(brand_names && brand_names !== 'N/A' ? brand_names.split(',').map(b => b.trim()) : []),
              ...(other_brands ? other_brands.split(',').map(b => b.trim()).filter(Boolean) : [])
            ];
           
            transformedData[uniqueKey] = {
              // Original fields (maintaining exact field names from original)
              'Doctor Name': doctor_name,
              'Code': code,
              'Camp Created Date': formattedDate,
              'Camp Date': camp_date ? moment(camp_date).format('DD-MM-YYYY hh:mm:ss a') : '',
              'No of Patient Screened': 0,
              'No of Patient Diagnosed': 0,
              'No of Rx Generated': 0,
             
              // Brand bifurcation fields
              'Brand Name 1': brand_name1,
              'Brand Count 1': brand_count1,
              'Brand Name 2': brand_name2,
              'Brand Count 2': brand_count2,
              'Brand Name 3': brand_name3,
              'Brand Count 3': brand_count3,
              'Brand Name 4': brand_name4,
              'Brand Count 4': brand_count4,
              'Other Brands': other_brands || '',
              'Other Brand Count': other_brand_count || '',
             
              // Patient details (will be arrays for multiple patients)
              'Patient Names': [],
              'Patient Ages': [],
              'Patient Genders': [],
              'Patient BP': [],
              'Patient SBP': [],
              'Patient DBP': [],
              'Patient Hypertensive': [],
              'Patient TC': [],
              'Patient TG': [],
              'Patient NONHDL': [],
              'Patient HDL': [],
              'Patient LDL': [],
              'Patient LDLHDL': [],
              'Patient Heart Rate': [],
              'Patient Fibrillation': [],
              'Patient Created Dates': []
            };
          }
 
 
          // Add patient data if exists
          if (pa_id && patient_name) {
            // Check if this patient is already added (to avoid duplicates)
            if (!transformedData[uniqueKey]['Patient Names'].includes(patient_name) ||
                transformedData[uniqueKey]['Patient Names'].length === 0) {
             
              transformedData[uniqueKey]['Patient Names'].push(patient_name || '');
              transformedData[uniqueKey]['Patient Ages'].push(age || '');
              transformedData[uniqueKey]['Patient Genders'].push(gender || '');
              transformedData[uniqueKey]['Patient BP'].push(bp || '');
              transformedData[uniqueKey]['Patient SBP'].push(sbp || '');
              transformedData[uniqueKey]['Patient DBP'].push(dbp || '');
              transformedData[uniqueKey]['Patient Hypertensive'].push(isHypertensive || '');
              transformedData[uniqueKey]['Patient TC'].push(tc || '');
              transformedData[uniqueKey]['Patient TG'].push(tg || '');
              transformedData[uniqueKey]['Patient NONHDL'].push(nonhdl || '');
              transformedData[uniqueKey]['Patient HDL'].push(hdl || '');
              transformedData[uniqueKey]['Patient LDL'].push(ldl || '');
              transformedData[uniqueKey]['Patient LDLHDL'].push(ldlhdl || '');
              transformedData[uniqueKey]['Patient Heart Rate'].push(heart_rate || '');
              transformedData[uniqueKey]['Patient Fibrillation'].push(fibrillation || '');
              transformedData[uniqueKey]['Patient Created Dates'].push(
                patient_created_date ? moment(patient_created_date).format('DD-MM-YYYY hh:mm:ss a') : ''
              );
            }
          }
 
 
          // Add the answer to the corresponding field (keeping original logic)
          if (rqid == 1 || rqid == 4 || rqid == 7) {
            transformedData[uniqueKey]['No of Patient Screened'] = Math.max(
              transformedData[uniqueKey]['No of Patient Screened'],
              parseInt(answer) || 0
            );
          } else if (rqid === 2 || rqid === 5 || rqid === 8) {
            transformedData[uniqueKey]['No of Patient Diagnosed'] = Math.max(
              transformedData[uniqueKey]['No of Patient Diagnosed'],
              parseInt(answer) || 0
            );
          } else if (rqid === 3 || rqid === 6 || rqid === 9) {
            transformedData[uniqueKey]['No of Rx Generated'] = Math.max(
              transformedData[uniqueKey]['No of Rx Generated'],
              parseInt(answer) || 0
            );
          }
        });
 
 
        // Convert arrays to comma-separated strings for CSV export
        const transformedArray = Object.values(transformedData).map(item => ({
          ...item,
          'Patient Names': item['Patient Names'].join(', '),
          'Patient Ages': item['Patient Ages'].join(', '),
          'Patient Genders': item['Patient Genders'].join(', '),
          'Patient BP': item['Patient BP'].join(', '),
          'Patient SBP': item['Patient SBP'].join(', '),
          'Patient DBP': item['Patient DBP'].join(', '),
          'Patient Hypertensive': item['Patient Hypertensive'].join(', '),
          'Patient TC': item['Patient TC'].join(', '),
          'Patient TG': item['Patient TG'].join(', '),
          'Patient NONHDL': item['Patient NONHDL'].join(', '),
          'Patient HDL': item['Patient HDL'].join(', '),
          'Patient LDL': item['Patient LDL'].join(', '),
          'Patient LDLHDL': item['Patient LDLHDL'].join(', '),
          'Patient Heart Rate': item['Patient Heart Rate'].join(', '),
          'Patient Fibrillation': item['Patient Fibrillation'].join(', '),
          'Patient Created Dates': item['Patient Created Dates'].join(', ')
        }));
 
 
        console.log("Transformed data:", transformedData);
        console.log("Transformed array:", transformedArray);
 
 
        // Define the fields for CSV columns (keeping original fields + new ones)
        const fields = [
          'Doctor Name', 'Code', 'Camp Created Date', 'Camp Date', 'CRID', 'Brand_Name',
          'No of Patient Screened', 'No of Patient Diagnosed', 'No of Rx Generated',
          'Brand Name 1', 'Brand Count 1', 'Brand Name 2', 'Brand Count 2',
          'Brand Name 3', 'Brand Count 3', 'Brand Name 4', 'Brand Count 4',
          'Other Brands', 'Other Brand Count',
          'Patient Names', 'Patient Ages', 'Patient Genders', 'Patient BP',
          'Patient SBP', 'Patient DBP', 'Patient Hypertensive', 'Patient TC',
          'Patient TG', 'Patient NONHDL', 'Patient HDL', 'Patient LDL',
          'Patient LDLHDL', 'Patient Heart Rate', 'Patient Fibrillation',
          'Patient Created Dates'
        ];
 
 
        // No additional date formatting needed as it's already done above
        // const formattedResult = transformedArray;
        const formattedResult = transformedArray.map(item => {
          // destructure away the fields you don’t want
          const {
            ['Patient Names']: _patientNames,
            ['Patient Created Dates']: _patientCreatedDates,
            ...rest
          } = item;

          // do any date formatting you still want on rest
          return {
            ...rest,
            Camp_Created_Date: moment(item.Camp_Created_Date).format('DD-MM-YYYY'),
            Camp_Date: item.Camp_Date ? moment(item.Camp_Date).format('DD-MM-YYYY') : ''
          };
        });

 
 
        const ws = XLSX.utils.json_to_sheet(formattedResult);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Camp Report');
 
 
        const buffer = XLSX.write(wb, { bookType: 'xlsx', type: 'buffer' });
 
 
        res.header('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        res.attachment('camp_report_detailed_with_id.xlsx');
        res.send(buffer);
      }
    });
  } catch (error) {
    logger.error(error.message);
    res.json(error);
  }
 };



// exports.getFilterCampReportCsv = async (req, res) => {
//   const { userId,subCatId,startDate, endDate, filterBy,empcode } = req.body; 

// const query ='SELECT eye_report_mst.erid,eye_report_mst.doc_name1, eye_report_mst.camp_date, eye_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM eye_report_mst LEFT JOIN question_camp_rep_mapping ON eye_report_mst.erid = question_camp_rep_mapping.crid;';
// //const query = 'SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.user_id AND camp_report_mst.subcat_id = question_camp_rep_mapping.created_by AND question_camp_rep_mapping.subcat_id where camp_report_mst.user_id =1 AND camp_report_mst.subcat_id=1;'
 
// //  const query1 = `WITH RECURSIVE EmployeeHierarchy AS (
// //   SELECT user_id, empcode, name, reporting
// //   FROM user_mst1
// //   WHERE reporting =${empcode}
// //   UNION ALL
// //   SELECT e.user_id, e.empcode, e.name, e.reporting
// //   FROM user_mst1 e
// //   INNER JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode
// // )
// // SELECT user_id, empcode, name
// // FROM EmployeeHierarchy
// // WHERE reporting IS NOT NULL;`;

 
//  try {
//     db.query(query, (err, result) => {
//       if (err) {
//       logger.error(err.message);

//         res.status(500).json({
//           errorCode: 'INTERNAL_SERVER_ERROR',
//           errorDetail: err,
//           responseData: {},
//           status: 'ERROR',
//           details: 'An internal server error occurred',
//           getMessageInfo: 'An internal server error occurred',
//         });
//       } else {
//         // Create an object to store the transformed data
//         const filterEmpId = result.map((employee)=>employee.user_id);
//         filterEmpId.unshift(userId)
//  //const query = 'SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE question_camp_rep_mapping.subcat_id=? and question_camp_rep_mapping.created_by IN (?);'
//  const query = `SELECT
//  crid,
//  doctor_name,
//  camp_date,
//  created_date,
//  rqid,
//  answer,
//  brand_id,
//  GROUP_CONCAT(DISTINCT description) AS description
//  FROM (
//  SELECT
//      camp_report_mst.crid,
//      camp_report_mst.doctor_name,
//      camp_report_mst.camp_date,
//      camp_report_mst.created_date,
//      question_camp_rep_mapping.rqid,
//      question_camp_rep_mapping.answer,
//      question_camp_rep_mapping.brand_id,
//      basic_mst.description
//  FROM
//      camp_report_mst
//  INNER JOIN
//      question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid
//  INNER JOIN
//      basic_mst ON FIND_IN_SET(basic_mst.basic_id, question_camp_rep_mapping.brand_id)
//  WHERE
//   question_camp_rep_mapping.subcat_id=? and question_camp_rep_mapping.created_by IN (?)
//  ) AS subquery
//  GROUP BY
//  crid, doctor_name, camp_date, created_date, rqid, answer, brand_id;
//  `   
//         try {
//               db.query(query,[subCatId,filterEmpId], (err, result) => {
//                 if (err) {
//                 logger.error(err.message);
          
//                   res.status(500).json({
//                     errorCode: 'INTERNAL_SERVER_ERROR',
//                     errorDetail: err,
//                     responseData: {},
//                     status: 'ERROR',
//                     details: 'An internal server error occurred',
//                     getMessageInfo: 'An internal server error occurred',
//                   });
//                 } else {
//                   // Create an object to store the transformed data
//                   const transformedData = {};
                   
//                   //console.log(result)
//                   // Loop through the result to group by doctor_name and camp_date
//                   result.forEach((row) => {
//                     const { doctor_name, camp_date, created_date, rqid, answer, description } = row;
          
//                     //const formattedDate = moment(created_date).format('DD-MM-YYYY hh:mm:ss a');
//                             //  const formattedDate2 = moment(camp_date).format('DD-MM-YYYY hh:mm:ss a');
//                               if (!transformedData[doctor_name]) {
//                                 transformedData[doctor_name] = {
//                                   'Doctor_Name': doctor_name,
//                                   'Camp_Date': camp_date,
//                                   'Camp_Created_Date': created_date,
//                                   'Brand_Name':description,
//                                   'No_of_Patient_Screened': 0,
//                                   'No_of_Patient_Diagnosed': 0,
//                                   'No_of_Prescription_Generated': 0,
//                                 };
//                               }
                    
//                               // Add the answer to the corresponding field
//                               if (rqid == 1 || rqid == 4 ||rqid == 7 ||rqid == 10 ||rqid == 13 ) {
//                                                       transformedData[doctor_name]['No_of_Patient_Screened'] = answer;
//                                                     } else if (rqid === 2 || rqid === 5 || rqid === 8 || rqid === 11 || rqid === 15) {
//                                                       transformedData[doctor_name]['No_of_Patient_Diagnosed'] = answer;
//                                                     } else if (rqid === 3 || rqid === 6 || rqid === 9 || rqid === 12 || rqid === 16) {
//                                                       transformedData[doctor_name]['No_of_Prescription_Generated'] = answer;
//                                                     }
//                             });
                    
//                             // Convert the object values into an array
//                             const transformedArray = Object.values(transformedData);
//                              console.log("a2",transformedArray)
//                             // Define the fields for CSV columns
//                             const fields = ['Doctor_Name', 'Camp_Date', 'Camp_Created_Date','Brand_Name', 'No_of_Patient_Screened', 'No_of_Patient_Diagnosed', 'No_of_Prescription_Generated'];
          
//                   // Apply different filters based on filterBy parameter
//                   let filteredData = [];
          
//                   if (filterBy === 'month') {
//                     // Filter by the last 30 days (month-wise)
//                     const thirtyDaysAgo = new Date();
//                     thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
          
//                     filteredData = transformedArray.filter((item) => {
//                       const itemDate = new Date(item.Camp_Date);
//                       return (
//                         (!startDate || itemDate >= new Date(startDate)) &&
//                         (!endDate || itemDate <= new Date(endDate)) &&
//                         itemDate >= thirtyDaysAgo
//                       );
//                     });
//                   } else if (filterBy === 'week') {
//                     // Filter by the last 7 days (week-wise)
//                     const sevenDaysAgo = new Date();
//                     sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);
          
//                     filteredData = transformedArray.filter((item) => {
//                       const itemDate = new Date(item.Camp_Date);
//                       return (
//                         (!startDate || itemDate >= new Date(startDate)) &&
//                         (!endDate || itemDate <= new Date(endDate)) &&
//                         itemDate >= sevenDaysAgo
//                       );
//                     });
//                   } else {
//                     // Custom filter, use the provided start and end dates
//                     filteredData = transformedArray.filter((item) => {
//                       const itemDate = new Date(item.Camp_Date);
//                       return (
//                         (!startDate || itemDate >= new Date(startDate)) &&
//                         (!endDate || itemDate <= new Date(endDate))
//                       );
//                     });
//                   }
          
//                   // Sort the filtered data by created_date (ascending)
//                   filteredData.sort((a, b) => new Date(a.Camp_Date) - new Date(b.Camp_Date));
//                   console.log("filterdata",filteredData)
//                   const formattedResult = filteredData.map((item) => ({
//                     ...item,
//                     Camp_Date: moment(item.Camp_Date).format('DD-MM-YYYY'),
//                     Camp_Created_Date: moment(item.Camp_Created_Date).format('DD-MM-YYYY'), // Convert date format
//                      // Convert date format
//                   }));
//                   //const fields = ['doctor_name', 'camp_date', 'created_date', 'No of Patient Screened', 'No of Patient Diagnosed', 'No of Prescription Generated'];
//                   const json2csvParser = new json2csv({ fields });
                  
//                   // Convert the data to CSV format
//                   const csv = json2csvParser.parse(formattedResult);
                  
//                   // Set the response headers for CSV download
//                   res.header('Content-Type', 'text/csv');
//                   res.attachment('camp_report.csv');
                  
//                   // Send the CSV data as the response
//                   res.status(200).send(csv);
                  
//                 }
//               });
//             } catch (error) {
//               logger.error(error.message);
          
//               res.json(error);
//             }
        
//       }
//     });
//   } catch (error) {
//     logger.error(error.message);

//     res.json(error);
//   }
// };

// working code
 exports.getFilterCampReport = async (req, res) => {
    const { userId,subCatId,startDate, endDate, filterBy } = req.body; 
  //const query ='SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid;';
  //const query = 'SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.user_id AND camp_report_mst.subcat_id = question_camp_rep_mapping.created_by AND question_camp_rep_mapping.subcat_id where camp_report_mst.user_id =1 AND camp_report_mst.subcat_id=1;'
   const query = `SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.code, camp_report_mst.created_date,
    question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer 
    FROM camp_report_mst 
    INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid 
    WHERE question_camp_rep_mapping.subcat_id=? and question_camp_rep_mapping.created_by=?
    and camp_report_mst.user_id = ? and camp_report_mst.subcat_id = ? 
    and camp_report_mst.status = "Y" and question_camp_rep_mapping.status = "Y"`
   
   //const query = 'CALL GetFilterCampReport(?,?)'
   
   try {
      db.query(query,[subCatId,userId,userId,subCatId], (err, result) => {
        if (err) {
        logger.error(err.message);

          res.status(500).json({
            errorCode: 'INTERNAL_SERVER_ERROR',
            errorDetail: err.message,
            responseData: {},
            status: 'ERROR',
            details: 'An internal server error occurred',
            getMessageInfo: 'An internal server error occurred',
          });
        } else {
          // Create an object to store the transformed data
          const transformedData = {};
  
          // Loop through the result to group by doctor_name and camp_date
          result.forEach((row) => {
            const { crid,doctor_name, code, created_date, rqid, answer } = row;
            if (!transformedData[doctor_name]) {
              transformedData[doctor_name] = {
                crid,
                doctor_name,
                code,
                created_date,
                question: [],
              };
            }
  
            // Add the question object to the question array
            transformedData[doctor_name].question.push({ rqid, answer });
          });
  
          // Convert the object values into an array
          const transformedArray = Object.values(transformedData);
          
          
          // Apply different filters based on filterBy parameter
          let filteredData = [];
  
          if (filterBy === 'month') {
            // Filter by the last 30 days (month-wise)
            const thirtyDaysAgo = new Date();
            thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
  
            filteredData = transformedArray.filter((item) => {
              const itemDate = new Date(item.created_date);
              return (
                (!startDate || itemDate >= new Date(startDate)) &&
                (!endDate || itemDate <= new Date(endDate)) &&
                itemDate >= thirtyDaysAgo
              );
            });
          } else if (filterBy === 'week') {
            // Filter by the last 7 days (week-wise)
            const sevenDaysAgo = new Date();
            sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);
  
            filteredData = transformedArray.filter((item) => {
              const itemDate = new Date(item.created_date);
              return (
                (!startDate || itemDate >= new Date(startDate)) &&
                (!endDate || itemDate <= new Date(endDate)) &&
                itemDate >= sevenDaysAgo
              );
            });
          } else {
            // Custom filter, use the provided start and end dates
            filteredData = transformedArray.filter((item) => {
              const itemDate = new Date(item.created_date);
              return (
                (!startDate || itemDate >= new Date(startDate)) &&
                (!endDate || itemDate <= new Date(endDate))
              );
            });
          }
  
          // Sort the filtered data by created_date (ascending)
          filteredData.sort((a, b) => new Date(a.created_date) - new Date(b.created_date));
  
          res.status(200).json({message:"filter camp report get successfully",
            errorCode:1,data:filteredData});
        }
      });
    } catch (error) {
      logger.error(error.message);

      res.json(error);
    }
  };
  


//   exports.getFilterCampReport = async (req, res) => {
//    const { userId,subCatId,startDate, endDate, filterBy,empcode } = req.body; 

//    const query1 = `WITH RECURSIVE EmployeeHierarchy AS (
//     SELECT user_id, empcode, name, reporting
//     FROM user_mst1
//     WHERE reporting =${empcode}
//     UNION ALL
//     SELECT e.user_id, e.empcode, e.name, e.reporting
//     FROM user_mst1 e
//     INNER JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode
// )
// SELECT user_id, empcode, name
// FROM EmployeeHierarchy
// WHERE reporting IS NOT NULL;`;
  
   
   
//    //const query = 'CALL GetFilterCampReport(?,?)'
   
//    try {
//       db.query(query1, (err, result) => {
//         if (err) {
//         logger.error(err.message);

//           res.status(500).json({
//             errorCode: 'INTERNAL_SERVER_ERROR',
//             errorDetail: err.message,
//             responseData: {},
//             status: 'ERROR',
//             details: 'An internal server error occurred',
//             getMessageInfo: 'An internal server error occurred',
//           });
//         } else {
//           // Create an object to store the transformed data
//               //console.log(result)
//           const filterEmpId = result.map((employee)=>employee.user_id);
//           filterEmpId.unshift(userId)
//           //console.log(filterEmpId);
//           //const query2 = 'SELECT camp_report_mst.crid, camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE question_camp_rep_mapping.subcat_id=? AND question_camp_rep_mapping.created_by=? AND camp_report_mst.user_id IN (?);';
//           const query = 'SELECT camp_report_mst.crid,camp_report_mst.doctor_name, camp_report_mst.camp_date, camp_report_mst.created_date, question_camp_rep_mapping.rqid, question_camp_rep_mapping.answer FROM camp_report_mst INNER JOIN question_camp_rep_mapping ON camp_report_mst.crid = question_camp_rep_mapping.crid WHERE question_camp_rep_mapping.subcat_id=? and question_camp_rep_mapping.created_by IN (?);'
            
//           try {
//                 db.query(query,[subCatId,filterEmpId], (err, result) => {
//                   if (err) {
//                   logger.error(err.message);
          
//                     res.status(500).json({
//                       errorCode: 'INTERNAL_SERVER_ERROR',
//                       errorDetail: err.message,
//                       responseData: {},
//                       status: 'ERROR',
//                       details: 'An internal server error occurred',
//                       getMessageInfo: 'An internal server error occurred',
//                     });
//                   } else {
//                     // Create an object to store the transformed data
//                     const transformedData = {};
            
//                     // Loop through the result to group by doctor_name and camp_date
//                     result.forEach((row) => {
//                       const { crid,doctor_name, camp_date, created_date, rqid, answer } = row;
//                       if (!transformedData[doctor_name]) {
//                         transformedData[doctor_name] = {
//                           crid,
//                           doctor_name,
//                           camp_date,
//                           created_date,
//                           question: [],
//                         };
//                       }
            
//                       // Add the question object to the question array
//                       transformedData[doctor_name].question.push({ rqid, answer });
//                     });
            
//                     // Convert the object values into an array
//                     const transformedArray = Object.values(transformedData);
                    
                    
//                     // Apply different filters based on filterBy parameter
//                     let filteredData = [];
            
//                     if (filterBy === 'month') {
//                       // Filter by the last 30 days (month-wise)
//                       const thirtyDaysAgo = new Date();
//                       thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
            
//                       filteredData = transformedArray.filter((item) => {
//                         const itemDate = new Date(item.camp_date);
//                         return (
//                           (!startDate || itemDate >= new Date(startDate)) &&
//                           (!endDate || itemDate <= new Date(endDate)) &&
//                           itemDate >= thirtyDaysAgo
//                         );
//                       });
//                     } else if (filterBy === 'week') {
//                       // Filter by the last 7 days (week-wise)
//                       const sevenDaysAgo = new Date();
//                       sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);
            
//                       filteredData = transformedArray.filter((item) => {
//                         const itemDate = new Date(item.camp_date);
//                         return (
//                           (!startDate || itemDate >= new Date(startDate)) &&
//                           (!endDate || itemDate <= new Date(endDate)) &&
//                           itemDate >= sevenDaysAgo
//                         );
//                       });
//                     } else {
//                       // Custom filter, use the provided start and end dates
//                       filteredData = transformedArray.filter((item) => {
//                         const itemDate = new Date(item.camp_date);
//                         return (
//                           (!startDate || itemDate >= new Date(startDate)) &&
//                           (!endDate || itemDate <= new Date(endDate))
//                         );
//                       });
//                     }
            
//                     // Sort the filtered data by created_date (ascending)
//                     filteredData.sort((a, b) => new Date(a.camp_date) - new Date(b.camp_date));
            
//                     res.status(200).json(filteredData);
//                   }
//                 });
//               } catch (error) {
//                 logger.error(error.message);
          
//                 res.json(error);
//               }
//         }
//       });
//     } catch (error) {
//       logger.error(error.message);

//       res.json(error);
//     }
//   };
 



const monthNames = [
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

const convertMonthNumberToName = (monthNumber) => {
  return monthNames[monthNumber - 1];
};


exports.totalCampCount = async (req, res) => {
   
  const {userId,subCatId} = req.body;
 
    let query = `
    SELECT
    COUNT(*) as Camp_Count,
    MONTH(created_date) AS report_month,
    YEAR(created_date) AS report_year
  FROM
    camp_report_mst
  WHERE
    created_date >= CURDATE() - INTERVAL 6 MONTH
    AND created_by = ? and subcat_id = ? and status = 'Y'
  GROUP BY
    YEAR(created_date), MONTH(created_date);
      `
  
  
  

  try {
    db.query(query,[userId,subCatId],(err, result) => {
      if (err) {
        logger.error(`Error in /controller/dashboard/totalCampCount: ${err.message}. SQL query: ${query}`);
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
         
        const sortedData = result.sort((a, b) => {
          // If years are different, sort by year
          if (a.report_year !== b.report_year) {
              return a.report_year - b.report_year;
          }
          // If years are the same, sort by month
          return a.report_month - b.report_month;
      });

      const xValues = sortedData.map(item => `${convertMonthNumberToName(item.report_month)} ${item.report_year}`);
      const yValues = sortedData.map(item => ({ y: item.Camp_Count }));
  
   

      res.status(200).json({message:"graph data get successfully",errorCode:1,data:{xValues,yValues}});
        //res.status(200).json(result);
      }
    });
  } catch (error) {
    logger.error(`Error in /controller/dashboard/totalCampCount: ${err.message}.`);
    res.json(error);
  }
};