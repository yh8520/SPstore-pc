const express=require("express");
const pool=require("../pool");
const router=express.Router()
router.get("/register",(req,res)=>{
    var $uname=req.query.uname;
    var $upwd=req.query.upwd;
    var sql ="INSERT INTO sp_user VALUES(null,?,?,null,null,null,null,null)";
   pool.query(sql,[$uname,$upwd],(err,result)=>{
          if(err)throw err;
          if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功"})
          }else{
            res.send({code:-1,msg:"注册失败"});
          }
    })
})
module.exports=router;