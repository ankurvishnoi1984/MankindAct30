
import { Route, Routes } from 'react-router-dom'
import './App.css'
import Login from './components/login/login'
import DashboardPage from './components/Pages/Dashboard'
import ReportPage from './components/Pages/Report'
import AdminProtectdRoute from './components/protectedroutes/protect'
import EmployeePage from './components/Pages/Employee'
import SummaryReportPage from './components/Pages/SummaryReport'
import PatientsReportPage from './components/Pages/PatientsReport'


function App() {

  return (
    <>
    <Routes>
       <Route path='/' element={<Login/>}></Route>
       <Route path='/dashboard' element={<AdminProtectdRoute><DashboardPage/></AdminProtectdRoute>}></Route>
       <Route path='/report' element={<AdminProtectdRoute><ReportPage/></AdminProtectdRoute>}></Route>
       <Route path='/employee' element={<AdminProtectdRoute><EmployeePage/></AdminProtectdRoute>}></Route>
       <Route path='/summaryReport' element={<AdminProtectdRoute><SummaryReportPage/></AdminProtectdRoute>}></Route>
       <Route path='/patientsReport' element={<AdminProtectdRoute><PatientsReportPage/></AdminProtectdRoute>}></Route>
    </Routes>
    </>
  )
}

export default App
