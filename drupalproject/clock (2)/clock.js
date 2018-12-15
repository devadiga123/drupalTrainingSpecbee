// Author Name: Akshay D
// Date:17-08-2018


//Accepting Current date  
 var today = new Date();
 var hour = today.getHours();
 var minute = today.getMinutes();
 var second = 180;


function clock()
{
    console.log(hour,minute,second);
    // if the hour exeeds 12 
    if(hour>12)
    {
        hour=hour-12;
    }
    // hour and minute angle set to current time
    hour=180+hour*30;
    minute=180+minute*6;

    document.getElementsByClassName("seconds_hand")[0].style.transform="rotate("+second+"deg)";
    document.getElementsByClassName("minute_hand")[0].style.transform="rotate("+minute+"deg)";
    document.getElementsByClassName("hour_hand")[0].style.transform="rotate("+hour+"deg)";
   
    // Setting an Interval For rotation of second hand ,minute hand,hour hand 
    setInterval(second_hand,1000);
    setInterval(minute_hand,1000);
    setInterval(hour_hand,1000);
    

}


// rotation of second hand 
function second_hand(){
    second+=6;
    var ref=document.getElementsByClassName("seconds_hand")[0];
    ref.style.transform="rotate("+second+"deg)";
    ref.style.transformOrigin="top left";
   
   

}


// rotation of minute hand 
function minute_hand(){
    minute+=0.1;
    var ref=document.getElementsByClassName("minute_hand")[0];
    ref.style.transform="rotate("+minute+"deg)";
    ref.style.transformOrigin="top left";
   


}

// rotation of hour hand 
function hour_hand(){
    hour+=0.0016;
    var ref=document.getElementsByClassName("hour_hand")[0];
    ref.style.transform="rotate("+hour+"deg)";
    ref.style.transitionOrigin="top left";
   
    

}


    
