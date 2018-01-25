import React from 'react';
import ReviewTile from './ReviewTile'

const WizardShow = (props) => {
return(
<div>
  <div className="wizard-show-component">
    <h1>{props.name}</h1>
    <img src= {`${props.imgUrl}`} alt=""/>
    <h1>{props.rating}</h1>

    <p>{props.description}</p>
  </div>

  <div>
  {reviews}
  </div>
  </div>
)
}

export default WizardShow;
