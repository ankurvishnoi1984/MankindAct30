
import { Link, NavLink, useNavigate } from "react-router-dom";
import "../../../style/css/sb-admin-2.min.css"

import "./navbar.css"
import { useState } from "react";
function Navbar({ children }) {
    const navigate = useNavigate();
    // const handelLogOut = () => {
    //     sessionStorage.removeItem("IsAdminLoggedIn");
    //     navigate("/");
    //     //window.location.reload();
    //   };


      const [isLogoutModalOpen, setIsLogoutModalOpen] = useState(false);

      const [isSidebarVisible, setIsSidebarVisible] = useState(false);

      const toggleSidebar = () => {
        setIsSidebarVisible(!isSidebarVisible);
      };


   
      console.log("is logout ",isLogoutModalOpen)
  const handleLogoutClick = () => {
    setIsLogoutModalOpen(true);
  };

  const handleLogoutConfirm = () => {
    sessionStorage.removeItem("IsAdminLoggedIn");
    navigate("/");
  };

  const handleLogoutCancel = () => {
    setIsLogoutModalOpen(false);
  };

    return (
    <div id="page-top">
        <div id="wrapper">
            {/* Sidebar */}
            <ul className={`navbar-nav ${isSidebarVisible?"nav-show1":"nav-show"} bg-gradient-primary sidebar sidebar-dark accordion`}>
                {/* Sidebar - Brand */}
                <NavLink to={"/dashboard"} className="sidebar-brand d-flex align-items-center justify-content-center">
                    {/* <div className="sidebar-brand-icon">
                        <i className="fas fa-user"></i>
                    </div>
                    <div className="sidebar-brand-text mx-3">Logo</div> */}

                

<img src="./images/Logo.png" alt="" style={{
    marginTop: '20px',
    backgroundColor: '#fff',
    padding: '5px',
    borderRadius: '.4em',
    width: '55%',
    marginBottom: '20px',
  }}></img>

                </NavLink>
                <hr className="sidebar-divider my-0" />
                {/* Nav Item - Dashboard */}
                <li className="nav-item">
                    <NavLink to={"/dashboard"} className={({isActive})=> isActive? "active-link nav-link" :"nav-link"}>
                        <i className="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </NavLink>
                </li>
                <hr className="sidebar-divider my-0" />
                {/* Nav Item - Summary Report */}
                <li className="nav-item ">
                    <NavLink to={"/report"} className={({isActive})=> isActive? "active-link nav-link" :"nav-link"}>
                        <i className="fas fa-fw fa-file-alt"></i>
                        <span>Hierarchy Report</span>
                    </NavLink>
                </li>

                <hr className="sidebar-divider my-0" />
                {/* Nav Item - Summary Report */}
                <li className="nav-item ">
                    <NavLink to={"/summaryReport"} className={({isActive})=> isActive? "active-link nav-link" :"nav-link"}>
                        <i className="fas fa-fw fa-file-alt"></i>
                        <span>Summary Report</span>
                    </NavLink>
                </li>
                <hr className="sidebar-divider my-0" />

                 <li className="nav-item ">
                    <NavLink to={"/patientsReport"} className={({isActive})=> isActive? "active-link nav-link" :"nav-link"}>
                        <i className="fas fa-fw fa-file-alt"></i>
                        <span>Patients Report</span>
                    </NavLink>
                </li>
                <hr className="sidebar-divider my-0" />
                 {/* Nav Item - Summary Report */}
                 <li className="nav-item ">
                    <NavLink to={"/employee"} className={({isActive})=> isActive? "active-link nav-link" :"nav-link"}>
                        <i className="fas fa-fw fa-file-alt"></i>
                        <span>Employee</span>
                    </NavLink>
                </li>
                <hr className="sidebar-divider my-0" />
            </ul>
            {/* End of Sidebar */}
            
            {/* Content Wrapper */}
            <div id="content-wrapper" className="d-flex flex-column">
                {/* Main Content */}
                <div id="content">
                    {/* Topbar */}
                    <nav className="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        {/* Sidebar Toggle (Topbar) */}
                        <button onClick={toggleSidebar} className="btn btn-link d-md-none rounded-circle mr-3">
                            <i className="fa fa-bars"></i>
                        </button>
                        {/* Topbar Search */}
                        {/* <form className="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div className="input-group">
                                <input type="text" className="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                                <div className="input-group-append">
                                    <button className="btn btn-primary" type="button">
                                        <i className="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form> */}
                        {/* Topbar Navbar */}
                     
                        <ul className="navbar-nav ml-auto">
                        
                            <li className="nav-item dropdown no-arrow dropdown1">
                                <div className="nav-link dropdown-toggle">
                                    <span className="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                                    <img className="img-profile rounded-circle" src="/images/userimg.png" alt="Profile" />
                                </div>
                              
                                <div className="dropdown-content">
                                    <p className="dropdown-item ditem" onClick={handleLogoutClick}>
                                        <i className="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </p>
                                </div>
                            </li>
                        </ul>

{/* <div className="nav-item dropdown no-arrow ml-auto">
        <div
          className="nav-link dropdown-toggle"
          id="userDropdown"
          role="button"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
        >
          <span className="mr-2 d-none d-lg-inline text-gray-600 small">
            Admin
          </span>
          <img
            className="img-profile rounded-circle"
            src="/images/userimg.png"
            alt="Profile"
          />
        </div>
        
        <div
          className={`dropdown-menu dropdown-menu-right shadow animated--grow-in ${
            isLogoutModalOpen ? "show" : ""
          }`}
          aria-labelledby="userDropdown"
        >
          <div
            className="dropdown-item"
            onClick={handleLogoutClick}
          >
            <i className="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
            Logout
          </div>
        </div>
        </div> */}
                    </nav>
                    {/* End of Topbar */}
                    {/* Begin Page Content */}
                     
                     {children}
                    {/* /.container-fluid */}
                </div>
                {/* End of Main Content */}
                {/* Footer */}
                <footer className="sticky-footer bg-white">
                    <div className="container my-auto">
                        <div className="copyright text-center my-auto">
                            {/* Copyright text goes here */}
                        </div>
                    </div>
                </footer>
                {/* End of Footer */}
            </div>
            {/* End of Content Wrapper */}
        </div>
        {/* End of Page Wrapper */}
        {/* Scroll to Top Button */}
        <a className="scroll-to-top rounded" href="#page-top">
            <i className="fas fa-angle-up"></i>
        </a>
        {/* Logout Modal */}
        {/* <div className="modal fade" id="logoutModal" tabIndex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div className="modal-dialog" role="document">
                <div className="modal-content">
                    <div className="modal-header">
                        <h5 className="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button className="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div className="modal-body">Select Logout below if you are ready to end your current session.</div>
                    <div className="modal-footer">
                        <button className="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <button className="btn btn-primary" onClick={handelLogOut} data-dismiss="modal" >Logout</button>
                    </div>
                </div>
            </div>
        </div> */}

           {/* Logout Modal */}
      {isLogoutModalOpen && (
        <div
          className="popup-container fade show"
        >
          <div className="modal-dialog" >
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title">
                  Ready to Leave?
                </h5>
                <button
                  className="close"
                  type="button"
                  onClick={handleLogoutCancel}
                >
                  <span>×</span>
                </button>
              </div>
              <div className="modal-body">
                Select Logout below if you are ready to end your current session.
              </div>
              <div className="modal-footer">
                <button
                  className="btn btn-secondary"
                  type="button"
                 
                  onClick={handleLogoutCancel}
                >
                  Cancel
                </button>
                <button
                  className="btn btn-primary"
                  onClick={handleLogoutConfirm}
                 
                >
                  Logout
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
    );
}

export default Navbar;
