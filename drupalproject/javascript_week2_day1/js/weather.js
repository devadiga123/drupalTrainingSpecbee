// Author Name:Akshay D
// date:14-08-2018


// main function for dynamic Weather Reading
function weather(){

  var selected_city = document.getElementById("selection");
    var city = selected_city.options[selected_city.selectedIndex].value;
    // function for dynamic Greetings
    var today= new Date();
    var hour=today.getHours();
    if(hour<12&&hour>=0){
      document.getElementById("static_para1").innerHTML="GOOD MORNING";
    }
    if(hour>=12&&hour<=16){
      document.getElementById("static_para1").innerHTML="GOOD NOON";
    }
    if(hour>16&&hour<19){
      document.getElementById("static_para1").innerHTML="GOOD EVENING";
    }
    

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          var weather_array=JSON.parse(this.response);

         
           var ids=['img1','img2','img3','img4','img5','img6','img7'];

            var days=["day1","day2","day3","day4","day5","day6","day7"];
            var lowest=["day1_reading_low","day2_reading_low","day3_reading_low","day4_reading_low","day5_reading_low","day6_reading_low","day7_reading_low"];
            var highest=["day1_reading_high","day2_reading_high","day3_reading_high","day4_reading_high","day5_reading_high","day6_reading_high","day7_reading_high"]
          
            for(let i=0;i<7;i++)
            {
        //   for days
          var day=weather_array.query.results.channel.item.forecast[i].day;
          var getday_var= getday(day);
          document.getElementById(days[i]).innerHTML =getday_var;

          console.log(weather_array.query.results.channel.item.forecast[i].text);

        // type of weather 
          var weather_type=weather_array.query.results.channel.item.forecast[i].text;
              if(weather_type=="Scattered Showers")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 7% 89%";
              }
              if(weather_type=="Breezy")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 65% 50%";
              }
              if(weather_type=="Thunderstorms")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 65% 89%";
              }
              if(weather_type=="Scattered Thunderstorms")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 64% 88%";
              }
              if(weather_type=="Mostly Cloudy")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 40% 7%";
              }
              if(weather_type=="Partly Cloudy")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 5% 50%";
              }
              if(weather_type=="Cloudy")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 65% 12%";
              }
              if(weather_type=="Sunny")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 10% 0";
              }
              if(weather_type=="Mostly Sunny")
              {
                document.getElementById(ids[i]).style.background="url('images/weather-icons_20180813_090711714.jpg') 94% 5%";
              }
              
              
              
        //   days low temp
          var low_temp=weather_array.query.results.channel.item.forecast[i].low;
          var low_temp_deg=(low_temp-32)*5/9;
          document.getElementById(lowest[i]).innerHTML=low_temp_deg.toFixed()+"&deg" + "|";
         //   day high temp
          var high_temp=weather_array.query.results.channel.item.forecast[i].high;
          var high_temp_deg=(high_temp-32)*5/9;
          document.getElementById(highest[i]).innerHTML=high_temp_deg.toFixed()+"&deg";

            }
            
        
        console.log(weather_array);


      }
    };
    xhttp.open("GET", "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22"+city+"%2C%20In%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys", true);
    xhttp.send();
  }
// function to choose day
  function getday(day){
   switch(day)
   {
       case 'Mon': return "MONDAY" ;
       case 'Tue': return "TUESDAY";
       case 'Wed': return "WEDNESDAY" ;
       case 'Thu': return "THURSDAY";
       case 'Fri': return "FRIDAY";
       case 'Sat': return "SATURDAY" ;
       case 'Sun': return "SUNDAY" ;
       
                }
  }