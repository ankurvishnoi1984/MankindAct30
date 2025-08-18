import { useEffect, useState } from "react";
import "../../../style/css/sb-admin-2.min.css"
import axios from "axios";
import { BASEURL } from "../constant/constant";
import * as XLSX from 'xlsx/xlsx.mjs';
import { ToastContainer, toast } from 'react-toastify';
import "./dashboard.css"
import Chart from 'chart.js/auto';
import 'react-toastify/dist/ReactToastify.css';
import ConfirmationPopup from "../popup/Popup";
import { Bar } from "react-chartjs-2";



function Dashboard() {
   
   
    const [catData,SetCatData] = useState([]);
    const [filter,setFilter] = useState('')
    const loginEmpCode = sessionStorage.getItem('empcode')


    const [name,SetName]= useState("");
    const [empcode,SetEmpcode]= useState("");
    const [state,SetState]= useState("");
    const [hq,SetHq]= useState("");
    const [city,SetCity]= useState("");
    const [pincode,SetPincode]= useState("");
    const [reporting,SetReporting]= useState("");
    const [password,SetPassword]= useState("");
    const [role,SetRole]= useState("");
    const [showConfirmation, setShowConfirmation] = useState(false);
    const [sDate, setSDate]= useState("");
    const [eDate, setEDate]= useState("");

    const [addUserModel,setAddUserModel] = useState(false)

    const [catValue, setCatValue] = useState('');

    const [categoryList, setCategoryList] = useState([]);

    const  handelSubCatChange =  (e)=>{
        setCatValue(e.target.value)
    }
    
    const [totals, setTotals] = useState({
        totalDoctorCount: 0,
        totalCampCount: 0,
        totalScreenedCount: 0,
        totalDiagnosedCount: 0,
        totalPrescriptionCount:0,
      });


      useEffect(() => {
        // Calculate totals when the component mounts or when 'data' changes
        const newTotals = catData.reduce((accumulator, item) => {
          accumulator.totalDoctorCount += item.doctor_count;
          accumulator.totalCampCount += item.camp_count;
          accumulator.totalScreenedCount += item.screened_count;
          accumulator.totalDiagnosedCount += item.diagnosed_count;
          accumulator.totalPrescriptionCount += item.prescription_count
          return accumulator;
        }, {
          totalDoctorCount: 0,
          totalCampCount: 0,
          totalScreenedCount: 0,
          totalDiagnosedCount: 0,
           totalPrescriptionCount:0
        });
    
        // Update state with the new totals
        setTotals(newTotals);
      }, [catData]);
    
    const handelCloseModel = ()=>{
        setAddUserModel(false)
    }
    const handleSubmit = async(e)=>{
        e.preventDefault();
        
        if (!name|| !empcode || !state || !hq || !city || !pincode || !reporting || !password|| !role) {
            toast.error("Missing required fields");
            return;
          }
          setShowConfirmation(true);
       
    }

      const handleCancel = () => {
        setShowConfirmation(false);
      };
    

    useEffect(()=>{
        GetCatData()
        getCategory();
    },[])
    
    async function GetCatData(){
        try {
            const res = await axios.get(`${BASEURL}/admin/getSubCatData`,{
              params:{
                empcode:loginEmpCode
              }
            })
            
            console.log("cat responce",res.data)
            SetCatData(res.data);

           
        } catch (error) {
           console.log(error) 
        }
    }

    async function getCategory() {
       try {
         const res = await axios.get(`${BASEURL}/cat/getSubCategory`);
          if(res?.data?.errorCode == 1){
            setCategoryList(res.data.data)
          }
       } catch (error) {
         console.log(error)
       }
    }
    
    console.log("cat list",categoryList)
    
   const handelReportDownload = ()=>{
    // Define custom column headers
    const headers = [
        'Category Name',
        'Camp Count',
        'Doctor Count',
        'Screened Count',
        'Diagnosed Count',
        'Prescription Count'
      ];
  
      // Map the data to match the custom column headers
      const mappedData = catData.map(item => ({
        'Category Name': item.cat_name,
        'Camp Count': item.camp_count,
        'Doctor Count': item.doctor_count,
        'Screened Count': item.screened_count,
        'Diagnosed Count': item.diagnosed_count,
        'Prescription Count': item.prescription_count
      }));
  
      const ws = XLSX.utils.json_to_sheet(mappedData, { header: headers });
      const wb = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(wb, ws, 'Data');
      XLSX.writeFile(wb, 'mankind_camp_data.xlsx');
    
   }


    // const handelDataChange =(e)=>{
    //    console.log(e.target.value)
    // } 
   
   const handelSingalReportDownload = (id)=>{
      const filterData = catData.filter((e)=>{
        return e.cat_id===id
      })
      // Define custom column headers
    const headers = [
        'Category Name',
        'Camp Count',
        'Doctor Count',
        'Screened Count',
        'Diagnosed Count',
        'Prescription Count'
      ];
  
      // Map the data to match the custom column headers
      const mappedData = filterData.map(item => ({
        'Category Name': item.cat_name,
        'Camp Count': item.camp_count,
        'Doctor Count': item.doctor_count,
        'Screened Count': item.screened_count,
        'Diagnosed Count': item.diagnosed_count,
        'Prescription Count': item.prescription_count
      }));
  
      const ws = XLSX.utils.json_to_sheet(mappedData, { header: headers });
      const wb = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(wb, ws, 'Data');
      XLSX.writeFile(wb, 'data.xlsx');
   } 

   async function GetFilterData(filterBy){
    try {
        const res = await axios.get(`${BASEURL}/admin/getSubCatFilterData?filter=${filterBy}`);
        SetCatData(res.data)
       
    } catch (error) {
       console.log(error) 
    }
}
   
   const handleFilter = (e)=>{
    setFilter(e.target.value)
    if(e.target.value){

        GetFilterData(e.target.value)
    }
    else{
        GetCatData();
    }

   }
   
   async function GetFilterDataByDate(start,end){
       
    if(filter){
        alert("Please Select Selected All Filter")
    }
       if(start && end){
       
    try {
        const res = await axios.get(`${BASEURL}/admin/getSubCatFilterData?startDate=${start}&endDate=${end}`);
        SetCatData(res.data)
       
    } catch (error) {
       console.log(error) 
    }
   }
   else{
    GetCatData();
   }
}

useEffect(()=>{
    GetFilterDataByDate(sDate,eDate)
},[sDate,eDate])



const [chartData, setChartData] = useState({
    labels: [],
    datasets: [{
      label:'Camp Count',
      backgroundColor: [],
      data: [],
    }],
  });

  const options = {
    scales: {
      x: {
        type: 'category',
        labels: chartData.labels,
      },
      y: {
        beginAtZero: true,
        min:0
      },
    },
    plugins: {
        legend: {
          display: false // Show legend as text only
        }
      },
      responsive: true, // Make the chart responsive
      maintainAspectRatio: false, // Don't maintain aspect ratio for responsiveness
    // title: {
    //   display: true,
    //   text: "Camp Added",
    // },
  };
   

  const [chartData1, setChartData1] = useState({
    labels: [],
    datasets: [
        {
          label: 'Patients Screened',
          backgroundColor: '#002D62',
          borderColor: '#002D62',
          borderWidth: 2,
          data: [],
        },
        {
          label: 'Patients Diagnosed',
          backgroundColor: '#6CB4EE',
          borderColor: '#6CB4EE',
          borderWidth: 2,
          data: [],
        }],
  });


  const options1 = {
    scales: {
      y: {
        beginAtZero: true,
      },
    },
    responsive: true, // Make the chart responsive
    maintainAspectRatio: false, // Don't maintain aspect ratio for responsiveness
  };
const monthNames = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  const convertMonthNumberToName = (monthNumber) => {
    return monthNames[monthNumber - 1];
  };

const getCampCount = async()=>{
   
    try {
        const response = await axios.post(`${BASEURL}/admin/getCampCount`,{catValue});

        console.log("doctor count response",response.data)

        const sortedData = response.data.sort((a, b) => {
            // If years are different, sort by year
            if (a.report_year !== b.report_year) {
                return a.report_year - b.report_year;
            }
            // If years are the same, sort by month
            return a.report_month - b.report_month;
        });

        const xValues = sortedData.map(item => `${convertMonthNumberToName(item.report_month)} ${item.report_year}`);
        const yValues = sortedData.map(item => item.Camp_Count);
        
        
        setChartData({
            labels: xValues,
            datasets: [{
              label:'Camp Count',  
              backgroundColor: ["#EAB870","#17a2b8","#6CB4EE","#6CB84D","#B64DB8","#6C4DB8"],
              data: yValues,
            }],
          });
    } catch (error) {
        console.log(error)
    }
}




const getScreenedCount = async () => {
    try {
      const response = await axios.post(`${BASEURL}/admin/getScreenedCount`, { catValue });
      const response1 = await axios.post(`${BASEURL}/admin/getDiagnosedCount`, { catValue });

      console.log("Survey data response", response.data);
      console.log("Survey data response2", response1.data);

      // Assuming response.data contains the same structure as your stacked bar chart data
      const sortedData = response.data.sort((a, b) => {
        // If years are different, sort by year
        if (a.report_year !== b.report_year) {
          return a.report_year - b.report_year;
        }
        // If years are the same, sort by month
        return a.report_month - b.report_month;
      });

      const sortedData1 = response1.data.sort((a, b) => {
        // If years are different, sort by year
        if (a.report_year !== b.report_year) {
          return a.report_year - b.report_year;
        }
        // If years are the same, sort by month
        return a.report_month - b.report_month;
      });

      const xValues = sortedData.map(item => `${convertMonthNumberToName(item.report_month)} ${item.report_year}`);
      const screened_count = sortedData.map(item => item.Screened_Count);
      const daigoned_count = sortedData1.map(item => item.Daignosed_Count);

      //const pendingValues = sortedData.map(item => item.survey_pending);
      setChartData1({
        labels: xValues,
        datasets: [
          { ...chartData1.datasets[0], data: screened_count },
          { ...chartData1.datasets[1], data: daigoned_count},
        ],
      });
    } catch (error) {
      console.error("Error fetching survey data:", error);
    }
  };

useEffect(()=>{
    getCampCount();
    getScreenedCount();
},[catValue])
  




return (
        <div className="container-fluid">

<div className="d-sm-flex align-items-center justify-content-between mb-4">
                            <form className="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                               
                            </form>
                           
                            <div className="dropdown ml-3 mt-3">
                                
                               
                                {/* Dropdown items go here */}
                                <select className="form-control selectStyle" onChange={handelSubCatChange} value={catValue}>
                                     <option value="">Select Category</option>
                                     {categoryList && categoryList.map((e)=>(
                                      <option key={e.subcategory_id} value={e.subcategory_id}>{e.subcategory_name}</option>
                                     ))}

                                </select>
                                
                            
                        </div>
                            <div className="dropdown ml-2 mt-3">
                                
                               
                                    {/* Dropdown items go here */}
                                    <select className="form-control selectStyle" name="filter" id="filter" onChange={handleFilter}>
                                         <option value="">Selected All</option>
                                         <option value="monthly">Month Wise</option>   
                                         <option value="weekly">Week Wise</option>   
                                    </select>
                                    
                                
                            </div>
                             {/* Datepicker for "From" date */}
        <div className="form-group ml-2">
            <label htmlFor="fromDate">From Date:</label>
            <input type="date" className="form-control" id="fromDate" placeholder="Select From Date" value={sDate} onChange={(e)=>setSDate(e.target.value)} />
        </div>

        {/* Datepicker for "To" date */}
        <div className="form-group ml-2">
            <label htmlFor="toDate">To Date:</label>
            <input type="date" className="form-control" id="toDate" placeholder="Select To Date" value={eDate} onChange={(e)=>setEDate(e.target.value)} />
        </div>
                        </div>
        <div className="row ">
            <div className="col-xl-2 col-md-4 mx-auto mb-4">
                <div className="card border-left-primary shadow h-100 py-2">
                    <div className="card-body">
                        <div className="row no-gutters align-items-center">
                            <div className="col mr-2">
                                <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Total Camps
                                </div>
                                <div className="h5 mb-0 font-weight-bold text-gray-800">{totals.totalCampCount}</div>
                            </div>
                            <div className="col-auto">
                                <i className="fas fa-hospital fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {/* Repeat similar card elements for Total Doctors, Patients Screened, and Patients Diagnosed */}
            
            <div className="col-xl-2 col-md-4 mx-auto mb-4">
                <div className="card border-left-primary shadow h-100 py-2">
                    <div className="card-body">
                        <div className="row no-gutters align-items-center">
                            <div className="col mr-2">
                                <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Total Doctors
                                </div>
                                <div className="h5 mb-0 font-weight-bold text-gray-800">{totals.totalDoctorCount}</div>
                            </div>
                            <div className="col-auto">
                                <i className="fas fa-user-nurse fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className="col-xl-2 col-md-4 mx-auto mb-4">
                <div className="card border-left-primary shadow h-100 py-2">
                    <div className="card-body">
                        <div className="row no-gutters align-items-center">
                            <div className="col mr-2">
                                <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Patients Screened
                                </div>
                                <div className="row no-gutters align-items-center">
                                    <div className="col-auto">
                                        <div className="h5 mb-0 font-weight-bold text-gray-800">{totals.totalScreenedCount}</div>
                                    </div>
                                </div>
                            </div>
                            <div className="col-auto">
                                <i className="fas fa-user fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className="col-xl-2 col-md-4 mx-auto mb-4">
                <div className="card border-left-primary shadow h-100 py-2">
                    <div className="card-body">
                        <div className="row no-gutters align-items-center">
                            <div className="col mr-2">
                                <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Patients diagnosed
                                </div>
                                <div className="h5 mb-0 font-weight-bold text-gray-800">{totals.totalDiagnosedCount}</div>
                            </div>
                            <div className="col-auto">
                                <i className="fas fa-user-check fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

             <div className="col-xl-2 col-md-4 mx-auto mb-4">
                <div className="card border-left-primary shadow h-100 py-2">
                    <div className="card-body">
                        <div className="row no-gutters align-items-center">
                            <div className="col mr-2">
                                <div className="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Prescription Count
                                </div>
                                <div className="h5 mb-0 font-weight-bold text-gray-800">{totals.totalPrescriptionCount}</div>
                            </div>
                            <div className="col-auto">
                                <i className="fas fa-user-check fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       {/* <div className="graphflex">
       <div className="graphdiv1">
       <p className="camp-p">Camp Count</p>
        <Bar data={chartData} options={options}></Bar>
       </div>
        <div className="graphdiv2"><Bar data={chartData1} options={options1}></Bar></div>  
        </div>         */}
                        <div className="card shadow mb-4">
                            <div className="card-header py-3">
                                <button onClick={handelReportDownload} className="d-none d-sm-inline-block btn btn-sm btn-info shadow-sm">
                                    <i className="fas fa-download fa-sm text-white-50"></i> Download Report
                                </button>
                            </div>
                            <div className="card-body">
                                <div className="table-responsive">
                                    <table className="table table-bordered" id="dataTable" width="100%" cellSpacing="0">
                                        <thead>
                                            <tr>
                                                <th>Category</th>
                                                <th>Total Camps</th>
                                                <th>Total Doctors</th>
                                                <th>Patients Screened</th>
                                                <th>Patients Diagnosed</th>
                                                <th>Prescription Generated</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {catData && catData.map((e)=>{
                                                return (

                                            <tr key={e.cat_id}>
                                                <td>{e.cat_name}</td>
                                                <td>{e.camp_count}</td>
                                                <td>{e.doctor_count}</td>
                                                <td>{e.screened_count}</td>
                                                <td>{e.diagnosed_count}</td>
                                                <td>{e.prescription_count}</td>
                                                <td><button className="btn-sm btn-primary btn-circle" style={{border:"none"}} onClick={()=>handelSingalReportDownload(e.cat_id)}><i className="fas fa-download"></i></button></td>
                                            </tr>
                                                )
                                            })}
                                           
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


          {addUserModel && (<div className="addusermodel">
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header" style={{ backgroundColor: '#0078df', color: '#fff' }}>
            <h5 className="modal-title">Add Employee</h5>
            <button  onClick ={handelCloseModel}type="button" className="close-but">
              <span >&times;</span>
            </button>
          </div>
          <div className="modal-body">
            <form onSubmit={handleSubmit}>
              <div className="form-row">
                <div className="form-group col-md-6">
                  <label htmlFor="inputName4">Name Of Employee</label>
                  <input type="text" onChange={(e)=>{
                      SetName(e.target.value)
                  }} 
                  className="form-control" id="inputName4" name="name" placeholder="Name"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="Code">Employee Code</label>
                  <input type="number" onChange={(e)=>{
                      SetEmpcode(e.target.value)
                  }}
                  className="form-control" id="Code" name="code" placeholder="Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="state">State</label>
                  <input type="text" onChange={(e)=>{
                      SetState(e.target.value)
                  }}
                   className="form-control" id="state" name="state" placeholder="State"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="city">City</label>
                  <input type="text" onChange={(e)=>{
                      SetCity(e.target.value)
                  }}
                   className="form-control" id="city" name="city" placeholder="City"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="HQ">HQ</label>
                  <input type="text" 
                  onChange={(e)=>{
                    SetHq(e.target.value)
                }}
                 className="form-control" id="HQ" name="hq" placeholder="HQ"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="pincode">Pin Code</label>
                  <input type="number" 
                  onChange={(e)=>{
                    SetPincode(e.target.value)
                }}
                className="form-control" id="pincode" name="pincode" placeholder="Pin Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="reporting">Reporting</label>
                  <input type="number" onChange={(e)=>{
                      SetReporting(e.target.value)
                  }}
                  className="form-control" id="reporting" name="reporting" placeholder="Employee Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="inputState">Designation</label>
                  <select id="inputState" onChange={(e)=>{
                      SetRole(e.target.value)
                  }}
                   className="form-control" name="designation" >
                    <option value={1}>Top Line</option>
                    <option value={2}>5th Line</option>
                    <option value={3}>4th Line</option>
                    <option value={4}>3rd Line</option>
                    <option value={5}>2nd Line</option>
                    <option value={6}>1st Line</option>
                    <option value={7}>MR</option>
                    
                  </select>
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="password">Password</label>
                  <input type="text" onChange={(e)=>{
                      SetPassword(e.target.value)
                  }}
                  className="form-control" id="password" name="password" placeholder="Password"  />
                </div>
              </div>
              <div className="text-center">
                <button type="submit" className="btn btn-primary mx-auto">Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    {showConfirmation && (
          <ConfirmationPopup
            message="Are you sure you want to Add Employee?"
            onConfirm={() => handleConfirm()}
            onCancel={handleCancel}
          />
        )}
    </div>)}
    <ToastContainer />
                    </div>
    );
}

export default Dashboard;
