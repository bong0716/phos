<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

:root {
  --tableBorder-color: rgb(99, 89, 0);
  --yellow-color: rgb(214, 166, 4);
  --lightYellow-color: rgb(153, 119, 2);
  --background-color: rgb(61, 61, 61);
  --tableBg-color: rgb(235, 235, 235);
}

body { 
  font-size: 140%; 
}

a {
  text-decoration: none;
  color: var(--yellow-color);
}

h2 {
  text-align: center;
  padding: 20px 0;
  color: rgb(255, 198, 4);
}

table caption {
  padding: .5em 0;
}

.subjectLink{
  text-decoration: none;
  color: rgb(214, 166, 4);
  font-weight: bold;
}

#boardT th {
    text-align: center;
    color: var(--yellow-color);
    background-color: var(--background-color);
    border: none;
}

#boardT td {
    text-align: center;
    color: var(--lightYellow-color);
    background-color: var(--background-color);
    border: none;
}


#boardT {
    background-color: var(--background-color);
    border-collapse: collapse;
    border-right: none;
    border-left: none;
    border-top-color: var(--yellow-color);
    width: 95%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 20px; 
    border-radius: 10px; 
    overflow: hidden;
}

.p {
  text-align: center;
  padding-top: 140px;
  font-size: 14px;
  color: rgb(255, 198, 4);
}

.page-number {
     display: inline-block;
     padding: 5px 10px; 
     border: 1px solid #333; 
 }

.selected {
    background-color: #333; 
    color: #fff;
}
 
.centered-pagination {
  text-align: center;
  display: block;
}

label {
  color: var(--yellow-color);
  font-weight: bold;
}

.container input:disabled, .container textarea:disabled {
    background-color: rgb(170, 170, 170);
    border-color: rgb(170, 170, 170); 
}

.modal-dialog {
    max-width: 50%;
    max-height: 100%; 
    top: 20%;
}
	
.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #F2EF93;
}

.modal-body form {
    display: flex;
    align-items: center;
}

.modal-body form textarea {
    flex: 1;
    width: auto;
    height: 120px;
    resize: none;
    margin-left: 10px;
}
   
P {
	color: #000000;
}

</style>