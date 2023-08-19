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
    var dataD=" "
    chatbox.appendChild(createChatLi(userMessage,"outgoing"))
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
          
          console.log("full msg :",res);
          console.log("msg : ",res[0]);
          chatbox.appendChild(createChatLi(res[0],"incoming"))

          if(res[1]){
            console.log("schoolar detected");
          }
          setTimeout(()=>{
            
            if(res[1]=="login"){
              console.log("redirecting to login");
              window.location.replace("http://127.0.0.1:8000/login");
            }else if(res[1]=="register"){
              console.log("redirecting to register");
              window.location.replace("http://127.0.0.1:8000/register");
            }else if(res[1]=="holiday"){
                chatbox.appendChild(createChatLi(data.holidays,"incoming"))
                //console.log(data.holidays[i][0] ,data.holidays[i][1]);
            }else if(res[1]=="resultall"){
                chatbox.appendChild(createChatLi(data.result,"incoming"))
            }else if(res[1]=="resultme"){
                chatbox.appendChild(createChatLi(data.result,"incoming"))
            }else if(res[1]=="complaint"){
              chatInput.value="subject : complaint\nMessage :"
            }else if(res[1]=="schoolarshipadd"){

              chatInput.value="schoolarship name : "
            }else{
              console.log("End of results");
            }
            
          },1000)
          

          
        });
    
    
    //message to be generate
    
    
    chatInput.value="";
    

}

sendChatbtn.addEventListener("click",handleChat)

