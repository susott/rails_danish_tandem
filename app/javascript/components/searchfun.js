function searchfun() {
  const advancedButton = document.getElementById("advanced-button");
  advancedButton.addEventListener("click", (event) => {
    const advanced_search = document.getElementById("advanced_search");
    advanced_search.classList.toggle("hide");
    //event.currentTarget.classList.toggle("hide");
    //advanced_search.style.display = 'none';

    //console.log(event);
    //console.log(event.currentTarget);
  }
)};

export { searchfun };
