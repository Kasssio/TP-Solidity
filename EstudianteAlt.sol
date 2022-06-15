
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _owner;
    mapping(string => address) private _docente;
    string[] private _materias;
    string private _nombre_completo;
    mapping(string => uint)[4] private _notas_materias;  
    event Log(address indexed sender, string message, uint materia);

    constructor(string memory nombre_, string memory curso_, string memory apellido_, string memory docente_)
    {
        _nombre = nombre_; 
        _curso = curso_;
        _apellido = apellido_;
        _docente[docente_] = msg.sender;
        _owner = msg.sender;
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }

    function nombre_completo() public view returns (string memory){
        return string (abi.encodePacked(_nombre, " ", _apellido));
    }

    function permiso_docente(string memory nombredocente_, address docentenuevo_) private
    {
        require(msg.sender == _owner);
        _docente[nombredocente_] = docentenuevo_;
    }

    function set_nota_materia(string memory materia, uint nota, uint bimestre, string memory docente_) private{
        require(msg.sender == _docente[docente_]);
        _notas_materias[bimestre][materia] = nota;
        _materias.push(materia);
        emit Log(msg.sender, materia, nota);
    }

    function nota_materia(string memory materia, uint bimestre) public view returns (uint){
        return _notas_materias[bimestre][materia];
    }

    function aprobo(string memory materia, uint bimestre) public view returns (bool){
        if(_notas_materias[bimestre][materia] >= 60)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }

    function promedio(uint bimestre) public view returns (uint){
        uint _promedio;
        for(uint i = 0; i < _materias.length; i++)
        {
            _promedio += _notas_materias[bimestre][_materias[i]];
        }

        _promedio /= _materias.length;
        return _promedio;
        
    }


}