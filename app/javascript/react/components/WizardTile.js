import React from 'react';
import { Link } from 'react-router'

const WizardTile = (props) => {
  let imgUrl = props.imgUrl
  if (props.imgUrl === 'wizclip.jpg') {
    imgUrl = `https://s3.us-east-2.amazonaws.com/wizard-reviews-production/${props.imgUrl}`
  }
   return(
     <div id='wizardElement'>
       <Link  to={`/wizards/${props.id}`}>
         <ul>
            <li id="indexbig">{props.name}</li>
         </ul>
         <img src={imgUrl} alt='wizardPic' id="wizardpic" height='75px' width='75px' />
         <p id="indexbig">Average Rating: {props.avgRating}</p>
       </Link>
     </div>
   )
}

export default WizardTile
