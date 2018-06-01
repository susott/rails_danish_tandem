import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: generateStrings(),
    typeSpeed: 100,
    loop: true
  });
}

function generateStrings(){
  const header = document.getElementById("typedjs-header");
  const userNames = JSON.parse(header.dataset.usernames);
  const languages = ["Danish", "German", "Spanish", "French", "Italian"];
  const finalStrings =[];
  let randomUserName = null;
  languages.forEach((language) => {
    randomUserName = userNames[Math.floor(Math.random() * (userNames.length - 1))];
    console.log(userNames[Math.floor(Math.random() * (userNames.length - 1))]);
    console.log(randomUserName)
    let finalString = `Learn ${language} ^1000 with ${randomUserName}`;
    finalStrings.push(finalString);
  });
  return finalStrings;
}

export { loadDynamicBannerText };
