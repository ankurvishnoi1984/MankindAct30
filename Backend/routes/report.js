const express = require("express");
const { getAllQuestionWithSubCatId, addAnswer, getAllCampReport, addReportWithInfo, getBrandWithId, updateReportWithInfo, updateAnswer, getReportInfoWithId, getAnswerWithId, getImages, deleteReportWithId, getReport, getEmpData, getEmpDataWithId, deleteSingalReportImg, findDoctorReportPresent,getEditEmpData, addPatients, updatePatients, deletePatients, getPatientsInfoWithId, getPatientsList } = require("../controller/report");


const router = express.Router();

router.post("/getQuestionWithSubCatId",getAllQuestionWithSubCatId);
router.post("/getBrandName",getBrandWithId)

router.post("/addReportWithInfo",addReportWithInfo)
router.post("/updateReportWithInfo",updateReportWithInfo);
router.post("/getReportInfoWithId",getReportInfoWithId);

router.post("/addPatient",addPatients)
router.post("/updatePatient",updatePatients);
router.post("/deletePatient", deletePatients);
router.post("/getPatientInfoWithId",getPatientsInfoWithId);
router.post("/getPatientsList", getPatientsList);

router.post("/addAnswer",addAnswer)
router.post("/updateAnswer",updateAnswer)
router.post("/getAnswerWithId",getAnswerWithId)

router.post("/getImages",getImages)
router.post("/deleteReportWithId",deleteReportWithId)
router.post("/getAllCampReport",getAllCampReport)
router.post("/deleteSingalImg",deleteSingalReportImg)
router.post("/getEmpData",getEmpData)
router.post("/getEmpDataWithId",getEmpDataWithId)
router.post("/findDoctorPresent",findDoctorReportPresent);
router.post("/getEditEmpData",getEditEmpData)
module.exports= router;