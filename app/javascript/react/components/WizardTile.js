import React from 'react';
import { Link } from 'react-router'

const WizardTile = (props) => {
   return(
     <div id='wizardElement'>
       <Link to={`/wizards/${props.id}`}>
         <ul id="wizlist">
            <li>{props.name}</li>
         </ul>
         <img src={`${props.imgUrl}`} alt='wizardPic' id="wizardpic" />
         <p id="wizlist">Average Rating: {props.avgRating}</p>
       </Link>
     </div>
   )
}

export default WizardTile
