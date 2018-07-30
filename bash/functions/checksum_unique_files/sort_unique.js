var new_list = {};
var temp_folder='./temp/';
var results_folder='./results/';

for ( file in files) { 
  

  var new_file = { 
    hash_name: [ files[file].hash, files[file].name].join(''), 
    name: files[file].name,
    hash: files[file].hash,
  }; 

  var command = [ 
    "mv ",
    temp_folder,
    new_file.hash_name,
    " ",
    results_folder,
    new_file.name,
    " ;",
  ];
  new_list[new_file.hash] = command.join('');
//   console.log(  command.join('') );  
}; 


console.log(Object.values(new_list).join('\n'));
Object.keys(new_list).length;
files=null;
new_list  = null; 
