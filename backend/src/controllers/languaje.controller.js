import { getConnection } from "../database/database";

const getLanguages=async (req, res)=>{
    try{
        const connection = await getConnection();
        const result=await connection.query("SELECT id, name, programers from languages")
        res.json(result);
    }catch(error){
        res.status(500)
        res.send(error.message);
    }
}

const getLanguage=async (req, res)=>{
    try{
        console.log(req.params);
        const {id} = req.params;
        const connection = await getConnection();
        const result=await connection.query("SELECT id, name, programers from languages where id = ?", id);
        res.json(result);
    }catch(error){
        res.status(500)
        res.send(error.message);
    }
}

const addLanguages=async (req, res)=>{
    try{
        const { name, programers } = req.body;
        if(name===undefined || programers===undefined){
            res.status(400).json({message:"Bad Request. Please fill all fields"});
        }
        const languages={ name, programers };
        const connection = await getConnection();
        await connection.query("INSERT INTO languages SET ?", languages)
        res.json({message: "Language added"});
    }catch(error){
        res.status(500)
        res.send(error.message);
    }
}

const deleteLanguage=async (req, res)=>{
    try{
        console.log(req.params);
        const {id} = req.params;
        const connection = await getConnection();
        const result=await connection.query("Delete from languages where id = ?", id);
        res.json(result);
    }catch(error){
        res.status(500)
        res.send(error.message);
    }
}

const updateLanguage=async (req, res)=>{
    try{
        const { id } = req.params;
        const { name, programers } = req.body;

        if(id ===undefined || name===undefined || programers===undefined){
            res.status(400).json({message:"Bad Request. Please fill all fields"});
        }

        const language = { name, programers };
        const connection = await getConnection();
        const result=await connection.query("UPDATE languages SET  ? where id = ?", [language, id]);
        res.json(result);
    }catch(error){
        res.status(500)
        res.send(error.message);
    }
}

export const methods = {
    getLanguages,
    getLanguage,
    addLanguages,
    deleteLanguage,
    updateLanguage
};