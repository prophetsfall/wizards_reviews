import React from 'react';
import ReviewTile from './ReviewTile'

const WizardShow = (props) => {
  let editForm = () =>{
    let editLink;
    if (props.creator_id === props.user_id) {
        editLink = <a href={`/wizards/${props.id}/edit`}>Edit or Delete your Wizard here</a>
    } else {
        <p></p>
    }
    return editLink
  }
  return(
    <div id='show'>
      <div className="wizard-show-component">
        <h1>{props.name}</h1>
        <img src= {`https://s3.us-east-2.amazonaws.com/wizard-reviews-production/${props.imgUrl}`} alt=""/>
        <h1>{props.rating}</h1>
        <p id="description">{props.description}</p>
      </div>
      <div>
        {editForm()}
      </div>
    </div>
  )
}

export default WizardShow;
