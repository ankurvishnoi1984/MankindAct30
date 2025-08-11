import { useEffect, useState } from "react";
import "../../../style/css/sb-admin-2.min.css"
import axios from "axios";
import { BASEURL } from "../constant/constant";

import { ToastContainer, toast } from 'react-toastify';
import "./employee.css"

import 'react-toastify/dist/ReactToastify.css';
import ConfirmationPopup from "../popup/Popup";
import EditModel from "./editEmpModel";
function Employee() {

    const [name,SetName]= useState("");
    const [empcode,SetEmpcode]= useState("");
    const [state,SetState]= useState("");
    const [hq,SetHq]= useState("");
    //const [city,SetCity]= useState("");
    const [pincode,SetPincode]= useState("");
    const [reporting,SetReporting]= useState("");
    const [password,SetPassword]= useState("");
    const [role,SetRole]= useState(1);
    const [showConfirmation, setShowConfirmation] = useState(false);
    const [showConfirmationDel, setShowConfirmationDel] = useState(false);
    const [delId, setDelId] = useState(null);

    const [addUserModel,setAddUserModel] = useState(false)
    const [editUserModel,setEditUserModel]= useState(false);

    const [empData, setEmpData] = useState([]);
    const [singalEmpData,setSingalEmpData] = useState({})
    const [searchQuery, setSearchQuery] = useState("")
    const [totalCount, setTotalCount] = useState(0)
    const [currentPage,setCurrentPage] = useState(1)
    
  
    const handelAddUser =()=>{
        setAddUserModel(true)
    }
    
    
    const handelEdit =async(id)=>{
      console.log(id)
      await GetEmpWithId(id)
      setEditUserModel(true)
      console.log("insdie handeledit",singalEmpData)
    }
    const handelDelete =async (id)=>{
      setDelId(id)
      setShowConfirmationDel(true)
      // try {
         
      //   //const res = await axios.delete(`${BASEURL}/admin/deleteEmp/${id}`)
         
      //   if(res.data.errorCode=="1"){
      //     toast.success("Employee Deleted successfully");
      //     await GetEmpData();
      //   }
      //   else{
      //     toast.error(`Failed to delete employee with ID ${id}`);
      //   }
       
      // } catch (error) {
      //   toast.error(error.message)
      // }
    }
    const handleConfirmDel = async () => {
      setShowConfirmationDel(false);
      try {
         
        const res = await axios.delete(`${BASEURL}/admin/deleteEmp/${delId}`)
         
        if(res.data.errorCode=="1"){
          toast.success("Employee Deleted successfully");
          await GetEmpData();
        }
        else{
          toast.error(`Failed to delete employee with ID ${delId}`);
        }
       
      } catch (error) {
        toast.error(error.message)
      }
      
    };
  
    const handleCancelDel = () => {
      setShowConfirmationDel(false);
    };
    
    const handelCloseModel = ()=>{
        setAddUserModel(false)
        setEditUserModel(false)
    }
    const handleSubmit = async(e)=>{
        e.preventDefault();
        
        if (!name|| !empcode || !state || !hq || !reporting || !password|| !role) {
            toast.error("Missing required fields");
            return;
          }
          setShowConfirmation(true);
       
    }
    const handleConfirm = async () => {
        setShowConfirmation(false);
        setAddUserModel(false)
        try {
            const res = await axios.post(`${BASEURL}/admin/addEmp`,{name,empcode,state,hq,pincode,reporting,password,role});
            toast.success("Employee created successfully");
            await GetEmpData()
        } catch (error) {
           console.log(error) 
        }
       
        SetName("")
        SetEmpcode("")
        SetState("")
        SetHq("")
        //SetCity("")
        SetPincode("")
        SetReporting("")
        SetPassword("")
        SetRole("")
        
      };

      const handleCancel = () => {
        setShowConfirmation(false);
      };
    
    
      useEffect(()=>{
        GetEmpData()
    },[currentPage,searchQuery,totalCount])

    async function GetEmpWithId(id){
      try {
        
        const res = await axios.get(`${BASEURL}/admin/getEmpWithId/${id}`);
        setSingalEmpData(res?.data?.user[0])
      } catch (error) {
        console.log(error)
      }
    }
    
    async function GetEmpData(){
        try {
            const res = await axios.get(`${BASEURL}/admin/getAllEmployee?page=${currentPage}&limit=20&searchName=${searchQuery}`);
            console.log("inside empdata",res?.data?.users)
            setTotalCount(res?.data?.totalCount)
            setEmpData(res?.data?.users)
           
        } catch (error) {
           console.log(error) 
        }
    }
     
    const handelNext = () => {
      if (currentPage * entriesPerPage < totalCount) {
        setCurrentPage((prev) => prev + 1);
      }
    };
    const handelPrevious = () => {
      if (currentPage > 1) {
        setCurrentPage((prev) => prev - 1);
      }
    };
   
    const handleSearchChange = event => {
      setSearchQuery(event.target.value);
      setCurrentPage(1)
    };
    // pagination logic 
    const entriesPerPage = 20;
    const startingEntry = (currentPage - 1) * entriesPerPage + 1;
    const endingEntry = Math.min(startingEntry + entriesPerPage - 1, totalCount);
  
    return (
        <div className="container-fluid">
           
                        {/* Page Heading */}
                        <div className="d-sm-flex align-items-center justify-content-between mb-4">
                            <form className="d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div className="input-group">
                                    <input type="text" className="form-control bg-light border-1 small" 
                                    // onChange={handleSearchChange}
                                    placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                                    <div className="input-group-append">
                                        <button className="btn btn-primary" type="button">
                                            <i className="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <button className="btn btn-primary btn-icon-split mt-3" onClick={handelAddUser}>
                                <span className="icon text-white-50">
                                    <i className="fas fa-plus"></i>
                                </span>
                                <span className="text">Add User</span>
                            </button>
                         
       
                        </div>
                        {/* Content Row */}
                        <div className="card shadow mb-4">
                            <div className="card-body">
                                <div className="table-responsive">
                                    <table className="table table-bordered" id="dataTable" width="100%" cellSpacing="0">
                                        <thead>
                                            <tr>
                                                <th>Employee Name</th>
                                                <th>Employee Code</th>
                                                
                                                <th>Hq</th>
                                                <th>Reporting</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {empData && empData.map((e)=>{
                                                return (

                                            <tr key={e.user_id}>
                                                <td>{e.name}</td>
                                                <td>{e.empcode}</td>
                                              
                                                <td>{e.hq}</td>
                                                <td>{e.reporting}</td>
                                                <td>
                                                  <button className="btn-sm btn-primary btn-circle m-1" style={{border:"none"}}><i className="fas fa-pencil-alt" onClick={()=>handelEdit(e.user_id)}></i></button>
                                                  <button className="btn-sm btn-primary btn-circle m-1" style={{border:"none"}} onClick={()=>handelDelete(e.user_id)}><i className="fas fa-trash"></i></button>
                                                </td>
                                            </tr>
                                                )
                                            })}
                                           
                                        </tbody>
                                    </table>
                                <div
                   className="textdiv"
                  >
                    <div>
                      {" "}
                      Showing {startingEntry} to {endingEntry} of {totalCount}{" "}
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
                  </div>
                                </div>
                            </div>
                        </div>


  {addUserModel && (
  <div className="addusermodel">
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
                      // SetName(e.target.value)
                  }} 
                  className="form-control" id="inputName4" name="name" placeholder="Name"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="Code">Employee Code</label>
                  <input type="number" onChange={(e)=>{
                      // SetEmpcode(e.target.value)
                  }}
                  className="form-control" id="Code" name="code" placeholder="Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="state">State</label>
                  <input type="text" onChange={(e)=>{
                      // SetState(e.target.value)
                  }}
                   className="form-control" id="state" name="state" placeholder="State"  />
                </div>
                {/* <div className="form-group col-md-6">
                  <label htmlFor="city">City</label>
                  <input type="text" onChange={(e)=>{
                      SetCity(e.target.value)
                  }}
                   className="form-control" id="city" name="city" placeholder="City"  />
                </div> */}
                <div className="form-group col-md-6">
                  <label htmlFor="HQ">HQ</label>
                  <input type="text" 
                  onChange={(e)=>{
                    // SetHq(e.target.value)
                }}
                 className="form-control" id="HQ" name="hq" placeholder="HQ"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="pincode">Pin Code</label>
                  <input type="number" 
                  onChange={(e)=>{
                    // SetPincode(e.target.value)
                }}
                className="form-control" id="pincode" name="pincode" placeholder="Pin Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="reporting">Reporting</label>
                  <input type="number" onChange={(e)=>{
                      // SetReporting(e.target.value)
                  }}
                  className="form-control" id="reporting" name="reporting" placeholder="Employee Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="inputState">Designation</label>
                  <select id="inputState" onChange={(e)=>{
                      // SetRole(e.target.value)
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
                      // SetPassword(e.target.value)
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
            // onConfirm={() => handleConfirm()}
            // onCancel={handleCancel}
          />
        )}
    </div>)}
    
    {showConfirmationDel && (
          <ConfirmationPopup
            message="Are you sure you want to Delete Employee?"
            // onConfirm={() => handleConfirmDel()}
            // onCancel={handleCancelDel}
          />
        )}

    {editUserModel &&  (
      <EditModel empData={singalEmpData} getfun={GetEmpData} setEditUserModel={setEditUserModel}/>
      )}
    <ToastContainer />
                    </div>
    );
}



export default Employee;
