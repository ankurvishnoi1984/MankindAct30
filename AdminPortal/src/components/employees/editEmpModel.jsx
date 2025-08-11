import ConfirmationPopup from "../popup/Popup";

import { toast } from 'react-toastify';
import "./employee.css"

import 'react-toastify/dist/ReactToastify.css';
import { useState } from "react";
import axios from "axios";
import { BASEURL } from "../constant/constant";
function EditModel({setEditUserModel,empData,getfun}){
  
  const [namee,SetNamee]= useState(empData.name);
  const [empcodee,SetEmpcodee]= useState(empData.empcode);
  const [statee,SetStatee]= useState(empData.state);
  const [hqe,SetHqe]= useState(empData.hq);
  //const [citye,SetCitye]= useState(empData.city);
  const [pincodee,SetPincodee]= useState(empData.pincode);
  const [reportinge,SetReportinge]= useState(empData.reporting);
  const [passworde,SetPassworde]= useState(empData.password);
  const [rolee,SetRolee]= useState(empData.role);

  const [showConfirmation, setShowConfirmation] = useState(false);
  
  console.log("inside editmode", setEditUserModel,empData,getfun)
  const handelCloseModel=()=>{
    setEditUserModel(false)
  }

  const handleSubmit = async(e)=>{
    e.preventDefault();
    console.log("reporting",typeof(reporting))
    if (!namee|| !empcodee || !statee || !hqe || !passworde|| !rolee) {
        toast.error("Missing required fields");
        return;
      }
      setShowConfirmation(true);
   
}

  const handleConfirm = async (id) => {

    console.log("isndie onconform",id);

    setShowConfirmation(false);
    setEditUserModel(false)
    try {
        const res = await axios.patch(`${BASEURL}/admin/updateEmpWithId/${id}`,{name:namee,empcode:empcodee,state:statee,hq:hqe,pincodee:pincodee,reporting:reportinge,password:passworde,role:rolee});
        if(res?.data?.errorCode === "1"){

          toast.success("Employee Updated successfully");
         let a= await getfun();
         console.log("inside upddate",a)
        }
        else{
          toast.warn("Error in Employee Updated")
        }
    } catch (error) {
       toast.warn(error.message) 
    }
   
    SetNamee("")
    SetEmpcodee("")
    SetStatee("")
    SetHqe("")
    //SetCitye("")
    SetPincodee("")
    SetReportinge("")
    SetPassworde("")
    SetRolee("")
    
  };

  const handleCancel = () => {
    setShowConfirmation(false);
  };
  return (
    <div className="addusermodel">
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header" style={{ backgroundColor: '#0078df', color: '#fff' }}>
            <h5 className="modal-title">Edit Employee</h5>
            <button  onClick ={handelCloseModel}type="button" className="close-but">
              <span >&times;</span>
            </button>
          </div>
          <div className="modal-body">
            <form onSubmit={handleSubmit}>
              <div className="form-row">
                <div className="form-group col-md-6">
                  <label htmlFor="inputName4">Name Of Employee</label>
                  <input type="text" value ={namee} onChange={(e)=>{
                      SetNamee(e.target.value)
                  }} 
                  className="form-control" id="inputName4" name="name" placeholder="Name"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="Code">Employee Code</label>
                  <input type="number" value ={empcodee}  onChange={(e)=>{
                      SetEmpcodee(e.target.value)
                  }}
                  className="form-control" id="Code" name="code" placeholder="Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="state">State</label>
                  <input type="text" value ={statee}  onChange={(e)=>{
                      SetStatee(e.target.value)
                  }}
                   className="form-control" id="state" name="state" placeholder="State"  />
                </div>
                {/* <div className="form-group col-md-6">
                  <label htmlFor="city">City</label>
                  <input type="text" value ={citye}  onChange={(e)=>{
                      SetCitye(e.target.value)
                  }}
                   className="form-control" id="city" name="city" placeholder="City"  />
                </div> */}
                <div className="form-group col-md-6">
                  <label htmlFor="HQ">HQ</label>
                  <input type="text" value ={hqe} 
                  onChange={(e)=>{
                    SetHqe(e.target.value)
                }}
                 className="form-control" id="HQ" name="hq" placeholder="HQ"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="pincode">Pin Code</label>
                  <input type="number" value ={pincodee} 
                  onChange={(e)=>{
                    SetPincodee(e.target.value)
                }}
                className="form-control" id="pincode" name="pincode" placeholder="Pin Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="reporting">Reporting</label>
                  <input type="number" value ={reportinge} onChange={(e)=>{
                      SetReportinge(e.target.value)
                  }}
                  className="form-control" id="reporting" name="reporting" placeholder="Employee Code"  />
                </div>
                <div className="form-group col-md-6">
                  <label htmlFor="inputState">Designation</label>
                  <select id="inputState" value={rolee} onChange={(e)=>{
                      SetRolee(e.target.value)
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
                  <input type="text" value ={passworde}  onChange={(e)=>{
                      SetPassworde(e.target.value)
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
            message="Are you sure you want to Edit Employee?"
            onConfirm={() => handleConfirm(empData.user_id)}
            onCancel={handleCancel}
          />
        )}
    </div>
  )
}

export default EditModel;