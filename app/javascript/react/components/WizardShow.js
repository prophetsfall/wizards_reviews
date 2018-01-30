import React from 'react';
import ReviewTile from './ReviewTile'

const WizardShow = (props) => {
  let editForm = () =>{
    let editLink;
  if (props.creator_id === props.user_id) {
      editLink = <div><a href={`/wizards/${props.id}/edit`}>Edit</a><br/>  <a href={`/wizards/${props.id}/destroy`}>Delete</a></div>


  } else {
      <p></p>
  }
  return editLink
}



  return(
    <div>
      <div className="wizard-show-component">
        <h1>{props.name}</h1>
        <img src= {`${props.imgUrl}`} alt=""/>
        <h1>{props.rating}</h1>
        <p>{props.description}</p>
      </div>
      <div>
        {editForm()}
      </div>
      <div>
        {props.reviews}
      </div>
    </div>
  )
}

export default WizardShow;
