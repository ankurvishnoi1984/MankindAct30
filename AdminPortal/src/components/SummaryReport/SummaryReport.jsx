
import { useEffect, useState } from "react";
import "../../../style/css/sb-admin-2.min.css"
import axios from "axios";
import { BASEURL } from "../constant/constant";
import * as XLSX from 'xlsx/xlsx.mjs';
import "./SummaryReport.css"
import Loader from "../utils/Loader";

const SummaryReport = () => {

  
  
    const [subCatData, SetSubCatData]= useState([]);
    const empcode = sessionStorage.getItem('empcode')
    console.log("empcode : ",empcode)


    const [subCatId, setSubCatId] = useState("");
  
    const [sDate,setSDate]= useState("");
    const [eDate,setEDate] = useState("");

    const [reportNumberWise,setReportNumberWise] = useState([])

    const [allReportData, setAllReportData]= useState([]);
    const [loading,setLoading] = useState(false)

    console.log(sDate,eDate)

    useEffect(()=>{
        
        GetSubCatInfo();
        GetDetiledData()
    
    },[])
   

  useEffect(()=>{
    getNumberWiseReport()
  },[subCatId])


 
  const handelSearchDate = ()=>{
    if(sDate && eDate){
      getNumberWiseReport()
    }
    else{
      alert("Please Select Date")
    }
  }

   

    async function getNumberWiseReport(){
     setLoading(true)
      
      try {
        let res
        if(!subCatId){
          res = await axios.post(`${BASEURL}/admin/getReportNumberWise?startDate=${sDate}&endDate=${eDate}&subCatId=${0}&empcode=${empcode}`)

        }else{

          res = await axios.post(`${BASEURL}/admin/getReportNumberWise?startDate=${sDate}&endDate=${eDate}&subCatId=${subCatId}&empcode=${empcode}`)
        }
        console.log("REsponse : ",res)
        setReportNumberWise(res.data.data)
      } catch (error) {
        console.log(error)
      }
      finally{
        setLoading(false);
      }
    }


    async function GetSubCatInfo(){
        try {
            const res = await axios.get(`${BASEURL}/admin/subCatInfo`);
            SetSubCatData(res.data)
        } catch (error) {
           console.log(error) 
        }
    }

    async function GetDetiledData(){
      try {
          const res = await axios.get(`${BASEURL}/admin/getReportDetailed`);
          setAllReportData(res.data)
      } catch (error) {
         console.log(error) 
      }
  }


   
    
    const handelReportDownloadDetailed = ()=>{
        // Define custom column headers
        const headers = [
            'Camp Report Id',
            'Employee Code',
            'Employee Name',
            'Doctor Name',
            'Doctor Code',
            'Category',
            'Screened Count',
            'Diagnosed count',
            'Prescription Count',
            'Brand Names',
            'Patients Name',
            'Age',
            'Gender',
            'SBP',
            'DBP',
            'Hypertensive',
            'TC',
            'TG',
            'HDL',
            'LDL',
            'HDL/LDL',
            'Non HDL',
            'Created At',
            'Modified At'
          ];

          
      
          // Map the data to match the custom column headers
          const mappedData = allReportData.map(item => ({
            'Camp Report Id':item.crid,
            'Employee Code': item.empcode,
            'Employee Name': item.username,
            'Doctor Name': item.doctor_name,
            'Doctor Code':item.code,
            'Category':item.subcategory_name,
            'Screened Count' : item.screened_count,
            'Diagnosed count' : item.diagnosed_count,
            'Prescription Count': item.prescription_count,
            'Brand Names': item.brand_names,
            'Patients Name': item.name,
            'Age': item.age,
            'Gender': item.gender,
            'SBP': item.sbp,
            'DBP': item.dbp,
            'Hypertensive': item.isHypertensive,
            'TC': item.tc,
            'TG': item.tg,
            'HDL': item.hdl,
            'LDL': item.ldl,
            'HDL/LDL': item.ldlhdl,
            'Non HDL': item.nonhdl,
            'Created At':item.created_date,
            'Modified At':item.modified_date
          }));
      
          const ws = XLSX.utils.json_to_sheet(mappedData, { header: headers });
          const wb = XLSX.utils.book_new();
          XLSX.utils.book_append_sheet(wb, ws, 'Data');
          XLSX.writeFile(wb, 'AllCampReportData.xlsx');
        
       }



       const handelReportDownloadNumberWise =()=>{
        const headers = [
          'Employee Code',
          'Employee Name',
          'Total Camps',
          'Total Doctor',
          'Patient Screened',
          'Patient Diagnosed',
          'Prescription Generated',
         
        ];

        
    
        // Map the data to match the custom column headers
        const mappedData = reportNumberWise.map(item => ({
          'Employee Code': item.empcode,
          'Employee Name': item.name,
          'Total Camps': item.TotalCampCount,
          'Total Doctor': item.TotalDoctorCount,
          'Patient Screened': item.TotalPatientScaneed,
          'Patient Diagnosed': item.TotalPatientDiagnosed,
          'Prescription Generated':item.TotalPrescribe,
        }));
    
        const ws = XLSX.utils.json_to_sheet(mappedData, { header: headers });
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Data');
        XLSX.writeFile(wb, 'CampReportDataHierarchy.xlsx');
       }
  
       const handelSingalReportDownload = (empcode)=>{
        // Define custom column headers
      
        const filterData = reportNumberWise.filter((e)=>{
            return e.empcode===empcode
          })
        const headers = [
            'Employee Code',
            'Employee Name',
            'Total Camps',
            'Total Doctor',
            'Patient Screened',
            'Patient Diagnosed',
            'Prescription Generated'
          ];

          
           //console.log("filterdata",filterData)
          // Map the data to match the custom column headers
          const mappedData = filterData.map(item => ({
          'Employee Code': item.empcode,
          'Employee Name': item.name,
          'Total Camps': item.TotalCampCount,
          'Total Doctor': item.TotalDoctorCount,
          'Patient Screened': item.TotalPatientScaneed,
          'Patient Diagnosed': item.TotalPatientDiagnosed,
          'Prescription Generated':item.TotalPrescribe,
          }));
          
          //console.log(mappedData);
          const ws = XLSX.utils.json_to_sheet(mappedData, { header: headers });
          const wb = XLSX.utils.book_new();
          XLSX.utils.book_append_sheet(wb, ws, 'employee');
          XLSX.writeFile(wb, 'employee.xlsx');
        
       }  
   
  return  loading ? <Loader/> : (
    <div className="container-fluid">
    {/* Content Row */}
       
   
    <div className="d-sm-flex align-items-start justify-content-end mb-4">
    <div className="dropdown ml-2">
    <select className="form-control selectStyle selecCamp" name="cat" id="cat" value={subCatId} onChange={(e)=>{
     setSubCatId(e.target.value)
    }}>
        <option value="">Select Camp</option>   
         {subCatData && subCatData.map((e) => (
        <option
            key={e.subcat_id}
            value={e.subcat_id}
        >
            {e.subcategory_name} Camp
        </option>
        ))}
      </select>
        </div>
    
         <div className="form-group ml-2">
            <label htmlFor="fromDate">From Date:</label>
            <input type="date" className="form-control" id="fromDate" placeholder="Select From Date" value={sDate} onChange={(e)=>setSDate(e.target.value)}/>
        </div>

        {/* Datepicker for "To" date */}
        <div className="form-group ml-2">
            <label htmlFor="toDate">To Date:</label>
            <input type="date" className="form-control" id="toDate" placeholder="Select To Date" value={eDate} onChange={(e)=>setEDate(e.target.value)}/>
        </div>

        <button className="btn btn-primary btn-icon-split" style={{marginTop:"30px", marginLeft:"5px"}} onClick={handelSearchDate}>
                                <span className="text">Search</span>
                                <span className="icon text-white-60">
                                    <i className="fas fa-search fa-sm"></i>
                                </span>
                            </button>

    </div>
    {/* Content Row */}
    <div className="card shadow mb-4">
        <div className="card-header py-3">

                <button onClick={handelReportDownloadNumberWise} className="d-none d-sm-inline-block btn btn-sm btn-info shadow-sm">
                <i className="fas fa-download fa-sm text-white-50"></i>Report Hierarchy</button>
            <button onClick={handelReportDownloadDetailed} className="d-none d-sm-inline-block btn btn-sm btn-info shadow-sm ml-2">
                <i className="fas fa-download fa-sm text-white-50"></i> Download Raw Data</button>
        </div>
        
        <div className="card-body">
            <div className="table-responsive">
                <table className="table table-bordered" id="dataTable" width="100%" cellSpacing="0">
                    <thead>
                        <tr>
                            <th>Employee Details</th>
                            <th>Total Camps</th>
                            <th>Total Doctors</th>
                            <th>Patients Screened</th>
                            <th>Patients Diagnosed</th>
                            <th>Prescription Generated</th>
                            <th>Download Report</th>
                            
                        </tr>
                    </thead>

                    <tbody>
                        {/* Repeat this row structure for each table row */}
                        {reportNumberWise && reportNumberWise
                        .filter(e => e.name !== "Admin")
                        .map((e)=>{
                            return(
                           <tr key={e.empcode}>
                            <td>{e.name}</td>
                            <td>{e.TotalCampCount}</td>
                            <td>{e.TotalDoctorCount}</td>
                            <td>{e.TotalPatientScaneed}</td>
                            <td>{e.TotalPatientDiagnosed}</td>
                            <td>{e.TotalPrescribe}</td>

                            <td><button onClick ={()=>handelSingalReportDownload(e.empcode)} style={{border:"none"}} className="btn-sm btn-primary btn-circle"><i className="fas fa-download"></i></button></td>
                           
                        </tr>
                            )
                        })}
                        
                        {/* Repeat this row structure for each table row */}
                    </tbody>
                </table>
                {/* <div
                   className="textdiv"
                  >
                    <div>
                      {" "}
                      Showing {startingEntry} to {endingEntry} of {reportData && pagelength}{" "}
                      entries
                    </div>
                    <div className="resdiv">
                      <button className="btn btn-light pag-but" onClick={handelPrevious}>
                        Previous
                      </button>
                      <button className="btn btn-light pag-but pag-but-bg">
                        {currentPage}
                      </button>
                      <button className="btn btn-light pag-but" onClick={handelNext}>
                        Next
                      </button>
                    </div>
                  </div> */}
            </div>
        </div>
    </div>
</div>
  )
}

export default SummaryReport