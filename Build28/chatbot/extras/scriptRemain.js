const chatInput = document.getElementById("input-msg");
const sendChatbtn = document.querySelector(".chat-input span");
const chatbox = document.getElementById("msg-chat");
let userMessage;
//add login and register page prompt user to login if not exist register save their details
const createChatLi = (message, className) =>{





    const chatLi = document.createElement("li");
    chatLi.classList.add("chat",className);
    let chatContent = className ==="outgoing" ? `<p>${message}</p>`: `<span class="material-symbols-outlined">smart_toy</span><p>${message}</p>`;
    chatLi.innerHTML = chatContent;
    return chatLi;
} 




const handleChat = ()=>{
    userMessage= chatInput.value;
    console.log(userMessage)
    if(!userMessage) return;
    const data=""
    fetch('', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: new URLSearchParams({
          'csrfmiddlewaretoken': document.querySelector('[name=csrfmiddlewaretoken]').value,
          'message': userMessage
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
          
          data = data.result;
          
        });
    
    chatbox.appendChild(createChatLi(userMessage,"outgoing"))
    //message to be generate
    chatbox.appendChild(createChatLi(data,"incoming"))
    
    chatInput.value="";
    

}

sendChatbtn.addEventListener("click",handleChat)

