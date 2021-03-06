import React,{useState} from 'react'
import Cookie from 'js-cookie'

import {SignUpAPI,hasEmailAPI,hasUserAPI} from './API/AuthAPI'

const SignUp = () => {

    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [tel, setTel] = useState('')
    const [uname, setUname] = useState('');
    const [pass, setPass] = useState('');
    const [canSign, setCanSign] = useState(false);
    const [emailClass, setEmailClass] = useState('form-control');
    const [userClass, setUserClass] = useState('form-control');


    const handleSignup = async(e) =>{
        e.preventDefault();
        const newAccount = {
            C_Name:name,
            C_Email:email,
            C_TelNo:tel,
            C_Username:uname,
            C_Password:pass
        }
        if(canSign){
            const data = await SignUpAPI(newAccount);
            if(data.data.auth){
                Cookie.set('id',data.data.id);
                window.location.reload(true);
            }
        }
    }
    const hasEmail=async()=>{
        
        const data = await hasEmailAPI({C_Email:email});
        if(!data.data.has){
            setCanSign(true);
            setEmailClass('form-control');
        }else{
            setEmailClass('form-control is-invalid');
            setCanSign(false);
        }
    }
    const hasUser=async()=>{
        
        const data = await hasUserAPI({C_Username:uname});
        if(!data.data.has){
            setCanSign(true);
            setUserClass('form-control');
        }else{
            setUserClass('form-control is-invalid');
            setCanSign(false);
        }
    }
    

    return (
        <div className="container">
            <h1>SignUp</h1>
            <hr/>
            <form>
                <div className="form-group">
                    <label>Name</label>
                    <input type="text" className="form-control" onChange={e=>setName(e.target.value)}  />
                </div>
                <div className="form-group">
                    <label>Email</label>
                    <input type="email" className={emailClass} onChange={e=>setEmail(e.target.value)} onBlur={hasEmail} />
                </div>
                <div className="form-group">
                    <label>Tel</label>
                    <input type="tel" className="form-control" onChange={e=>setTel(e.target.value)} />
                </div>
                <div className="form-group">
                    <label>Username</label>
                    <input type="text" className={userClass} onChange={e=>setUname(e.target.value)} onBlur={hasUser} />
                </div>
                <div className="form-group">
                    <label>Password</label>
                    <input type="password" className="form-control" onChange={e=>setPass(e.target.value)} />
                </div>
                <div className="form-group">
                    <small>If you have an account, <a href="/signin">Sign In</a></small>
                </div>
                <button id="auth-btn" className="btn btn-success" onClick={handleSignup}>SignUp</button>
            </form>
        </div>
    )
}

export default SignUp
