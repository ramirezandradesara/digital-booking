function scrollTo() {
    if (window.innerWidth > 768) {
      window.scrollTo({
        top: 400,
        left: 0,
        behavior: 'smooth'
      });
    } else if (window.innerWidth <= 768 && window.innerWidth > 480) {
      window.scrollTo({
        top: 900,
        left: 0,
        behavior: 'smooth'
      });
    } else {
      window.scrollTo({
        top: 1500,
        left: 0,
        behavior: 'smooth'
      });
    }
  }

  export default scrollTo;