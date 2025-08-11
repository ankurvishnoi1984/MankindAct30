const express = require("express");
const {getDataForImageDownload, getReport, getTopLine, getSubCatData,totalPatientScreened,totalPatientDiagnosed, AdminLogin, totalCamps, totalDoctor, totalPaScreened, totalPaDiagnosed, subCatInfo, addEmployee, getSubCatFiterData, getReportNormal, downloadReportNormal, downloadReportFilter, getAllEmployee, deleteEmployee, getEmployeeWithId, UpdateEmployee,getReportNumberWise,getReportDetailed,getReportFromTop,totalDoctorCount,totalCampCount, getPatientsList, getReportDetailed1 } = require("../controller/adminDashboard");


const router = express.Router();


router.get("/totalCamp",totalCamps)
router.get("/totalDoctor",totalDoctor)
router.get("/totalPatientScreened",totalPaScreened)
router.get("/totalPatientDiagnosed",totalPaDiagnosed)

router.get("/getReport",getReport)
router.get("/getReportNormal",getReportNormal)
router.get("/downloadReport", downloadReportNormal)
router.get("/downloadReportFilter",downloadReportFilter)
router.post("/getEmp",getTopLine)
router.get("/getSubCatData",getSubCatData)
router.get("/getSubCatFilterData",getSubCatFiterData)

router.get("/subCatInfo",subCatInfo)
router.post("/login",AdminLogin)
router.post("/addEmp",addEmployee)

router.get("/getAllEmployee",getAllEmployee)
router.delete('/deleteEmp/:id',deleteEmployee)
router.get('/getEmpWithId/:id',getEmployeeWithId)
router.patch('/updateEmpWithId/:id',UpdateEmployee)
// router.get('/imageDownload', getDataForImageDownload)
router.get('/imageDownload/:userId', getDataForImageDownload)
router.post('/getReportNumberWise', getReportNumberWise)
router.get('/getReportDetailed', getReportDetailed)
router.post('/getSingalReportDetailed', getReportDetailed1)
router.post('/getReportFromTop', getReportFromTop)


router.post('/getDoctorCount', totalDoctorCount)
router.post('/getCampCount', totalCampCount)
router.post('/getScreenedCount', totalPatientScreened)
router.post('/getDiagnosedCount', totalPatientDiagnosed)

// patient api

router.post('/getPatientsList', getPatientsList)

module.exports= router;