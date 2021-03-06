const express = require('express');
const colors = require('colors');
const app = express();

const mysql = require('mysql');

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "omakase"
})

con.connect((err,resp)=>{
    if(err)throw err;
    console.log(`Database in RESERVE_ROUTE is connecting`.red.bgCyan);
})

app.post('/get_user_trip',(req,res)=>{
    
    const {id} = req.body;
    const sql = `select * from trip where (Trip_id = ${id})`;

    con.query(sql,(err,resp)=>{
        res.json(resp[0]);
    })

})

app.get('/get_trip',(req,res)=>{
    
    const sql = `select * from trip`;
    con.query(sql,(err,resp)=>{
        res.json(resp);
    })
})

app.post('/insert_trip',(req,res)=>{

    const {name,desp,date,price} = req.body;
    const sql = `insert into trip(T_name,T_description,T_date,T_price,T_seat) 
    values('${name}','${desp}','${date}','${price}','${0}')`;

    con.query(sql,(err,resp)=>{
        res.json(resp);
    })

})

app.post('/delete_trip',(req,res)=>{
    
    const {id} = req.body;
    
    sql = `DELETE FROM trip WHERE Trip_id = '${id}'`;

    con.query(sql,(err,resp)=>{
        console.log("Number of records deleted: " + resp.affectedRows);
        res.json(resp);
    })
    
})

app.post('/buy_trip',(req,res)=>{

    const {seat,list,user_id,trip_id} = req.body;
    
    con.query(`UPDATE trip SET T_seat = '${seat}' WHERE (Trip_id = '${trip_id}')`,(err,resp)=>{
        console.log(`Update Trip`+resp.message)
    })
    
    con.query(`UPDATE customers SET C_Trip_List = '${list}' WHERE (Customer_id = '${user_id}')`,(err,resp)=>{
        console.log(`Update User`+resp.message)
    })

})

module.exports = app