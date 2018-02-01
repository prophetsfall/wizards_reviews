import React from 'react';
import ReviewTile from './ReviewTile'

const WizardShow = (props) => {
  let editForm = () =>{
    let editLink;
  if (props.creator_id === props.user_id) {
      editLink = <a href={`/wizards/${props.id}/edit`} id="linkage">Edit or Delete your Wizard here</a>
  } else {
      <p></p>
  }
  return editLink
}
  return(
    <div id="test">
      <h1 id="header">{props.name}</h1>
      <div id='show'>
        <div className="wizard-show-component">
          <img src= {`${props.imgUrl}`} alt=""/>
          <h1>{props.rating}</h1>
        </div>
      </div>

      <div id="footer">
        <p>Lore: {props.description}</p>
      </div>
      <div>
        {editForm()}
      </div>
    </div>
  )
}

export default WizardShow;
