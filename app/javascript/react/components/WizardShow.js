import React from 'react';
import ReviewTile from './ReviewTile'

const WizardShow = (props) => {
  let editForm = () =>{
    let editLink;
    if (props.creator_id === props.user_id) {
        editLink = <a id="editYourWizard" href={`/wizards/${props.id}/edit`}>Edit or Delete your Wizard here</a>
    } else {
        <p></p>
    }
    return editLink
  }

  let imgUrl = props.imgUrl
  if (props.imgUrl === 'wizclip.jpg') {
    imgUrl = `https://s3.us-east-2.amazonaws.com/wizard-reviews-production/${props.imgUrl}`
  }
  return(


    <div id="test">
      <h1 id="header">{props.name}</h1>
      <div id='show'>
        <div className="wizard-show-component">
          <img src={imgUrl} alt="wizard_pic_alt" id="showpic"/>
          <h1 id="rattingBubble">{props.rating}</h1>
        </div>
      </div>

      <div id="footer">

        <p>Lore: {props.description}</p>
        <p>School of Magic: {props.school}</p>
      </div>
      <div>
        {editForm()}
      </div>
    </div>
  )
}

export default WizardShow;
