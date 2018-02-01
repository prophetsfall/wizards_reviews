import React from 'react';
import { Link } from 'react-router'

const WizardTile = (props) => {
   return(
     <div id='wizardElement'>
       <Link to={`/wizards/${props.id}`}>
         <ul id="wizlist">
            <li>{props.name}</li>
         </ul>
         <img src={`https://s3.us-east-2.amazonaws.com/wizard-reviews-production/${props.imgUrl}`} alt='wizardPic' id="wizardpic" height='75px' width='75px' />
         <p id="wizlist">Average Rating: {props.avgRating}</p>
       </Link>
     </div>
   )
}

export default WizardTile
