
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notas_materias;
    

    constructor(string memory nombre_, string memory curso_, string memory apellido_){
        _nombre = nombre_; 
        _curso = curso_;
        _apellido = apellido_;
        _docente = msg.sender;
    }

    function nombre() public view returns (string memory){
        return _nombre;
    }

    function nombre() public view returns (string memory nombre_completo){
        nombre_completo = _nombre + " " + _apellido;
        return nombre_completo;
    }

    function set_nota_materia(string memory materia, uint nota) public{
        require(msg.sender == docente);
        notas_materias[materia] = nota;
    }

    function Nota_materia(string memory materia) public view returns (uint){
        return notas_materias[materia];
    }

    function aprobo(string memory materia) public view returns (bool){
        if(notas_materias[materia] >= 6)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }

    function promedio(string memory) public view returns (uint){
        notas_materias.l
        
    }


}