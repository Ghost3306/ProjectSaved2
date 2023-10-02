const sendbtn = document.getElementById("sendbtn");
const chatinp = document.getElementById("msg");
const cbody = document.getElementById("cbody");
const messagesList = document.querySelector('.messages-list');
const messageForm = document.querySelector('.message-form');
const messageInput = document.querySelector('.message-input');



messageForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const message = messageInput.value.trim();

    const messageItem = document.createElement('li');
    messageItem.innerHTML = `<p>${message}</p>`;
    cbody.appendChild(messageItem);
    messageInput.value = '';

 
    fetch('', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        'csrfmiddlewaretoken': document.querySelector('[name=csrfmiddlewaretoken]').value,
        'message': message
      })
    })
      .then(response => response.json())
      .then( data => {
        const res = data.response;
        console.log("Tag : ",res[1]);
        
        const messageItem = document.createElement('li');
        console.log("msg : ",res[0]);
        function holid(){
          var holiday = data.holidays;
          holiday.forEach(element => {
            console.log(element);
            messageItem.innerHTML = `<p>${element}</p>`;
            cbody.appendChild(messageItem);
          }); 
          
        }
     
        messageItem.innerHTML = `<p>${res[0]}</p>`;
        cbody.appendChild(messageItem);
        setInterval(0);
        setTimeout(()=>{
          if(res[1]=="login"){
            console.log("redirecting to login");
            window.location.replace("http://127.0.0.1:8000/login");
          }else if(res[1]=="register"){
            console.log("redirecting to register");
            window.location.replace("http://127.0.0.1:8000/register");
          }else if(res[1]=="holiday"){
            messageItem.innerHTML = `<p>${data.holidays}</p>`;
            cbody.appendChild(messageItem);
              //console.log(data.holidays[i][0] ,data.holidays[i][1]);
          }else if(res[1]=="resultall"){
            messageItem.innerHTML = `<p>${data.result}</p>`;
            cbody.appendChild(messageItem);
          }else if(res[1]=="resultme"){
            messageItem.innerHTML = `<p>${data.result}</p>`;
            cbody.appendChild(messageItem);
          }
          
        },2000)
        
        
      });
  });
