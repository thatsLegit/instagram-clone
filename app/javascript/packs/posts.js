window.loadFile = (event) => {
  const output = document.getElementById("image-preview");
  console.log(output);
  output.src = URL.createObjectURL(event.target.files[0]);
};
