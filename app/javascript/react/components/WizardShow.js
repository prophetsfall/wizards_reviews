import React from 'react';

const WizardShow = (props) => {
return(
  <div className="wizard-show-component">
    <h1>{props.name}</h1>
    <img src= {`${props.imgUrl}`} alt=""/>
    <h1>{props.rating}</h1>
    <p>{props.description}</p>
  </div>
)
}

export default WizardShow;
