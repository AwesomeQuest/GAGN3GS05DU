
  console.log(json);
  
  let avg = 0;
  
  json.forEach((j, index) => {
    avg += j.credits;
    
  });

  avg = avg / json.length;

  console.log(avg);