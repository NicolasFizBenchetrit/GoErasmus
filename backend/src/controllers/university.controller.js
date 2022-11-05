import { getConnection } from "../database/database";

const addUniversity = async (req, res) => {
    try {
        const { nombre, urlLogo, ciudad_idCiudad } = req.body;

        if (nombre === undefined || urlLogo === undefined || ciudad_idCiudad === undefined)
            res.status(400).json({message: "Bad Request. Please fill all fields"});
        const university = { nombre, urlLogo, ciudad_idCiudad };
        const connection = await getConnection();

        await connection.query("INSERT INTO universidad SET ?", university);
        res.json({message: "University added successfully"});
    } catch(error) {
        res.status(500).send(error.message);
    }
}

const getUniversities = async (req, res) => {
    try {
        const connection = await getConnection();
        const {id} = req.query;
        let query;
        if (id === undefined)
            query = await connection.query(`SELECT u.nombre as nombreUniversidad, c.nombre as nombreCiudad
                                            FROM Universidad u LEFT JOIN Ciudad c ON (c.idCiudad = u.ciudad_idCiudad)`);
        else
            query = await connection.query(`SELECT u.nombre as nombreFacultad, u.urlLogo as urlLogo
                                            FROM Universidad u JOIN Ciudad ON idCiudad = ciudad_idCiudad WHERE idCiudad = ?`, id);
        res.json(query);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

const getUniversityById = async (req, res) => {
    try {
        const connection = await getConnection();
        const {id} = req.params;
        const query = await connection.query(`SELECT nombre as nombreUniversidad, urlLogo FROM universidad WHERE idUniversidad=?`, id);
        res.json(query);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

const updateUniversity = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, urlLogo, ciudad_idCiudad } = req.body;
        console.log(id);
        if (id === undefined || nombre === undefined || urlLogo === undefined || ciudad_idCiudad === undefined)
            res.status(400).json({message:"Bad Request. Please fill all fields"});

        const universidad = { nombre, urlLogo, ciudad_idCiudad };
        const connection = await getConnection();
        const query = await connection.query("UPDATE universidad SET ? WHERE idUniversidad = ?", [universidad, id]);
        res.json(query);
    } catch(error) {
        res.status(500).send(error.message);
    }
}

const deleteUniversity = async (req, res) => {
    try {
        const {id} = req.params;
        const connection = await getConnection();
        const query = await connection.query("DELETE FROM universidad WHERE idUniversidad = ?", id);
        res.json(query);
    } catch(error) {
        res.status(500).send(error.message);
    }
}

export const methods = {
    addUniversity,
    getUniversities,
    getUniversityById,
    updateUniversity,
    deleteUniversity
};