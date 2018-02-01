import React from 'react';
import { Link } from 'react-router'

const WizardTile = (props) => {
   return(
     <div id='wizardElement'>
       <Link  to={`/wizards/${props.id}`}>
         <ul>
            <li id="maketwo">{props.name}</li>
         </ul>
         <img src={`${props.imgUrl}`} alt='wizardPic' id="wizardpic" />
         <p class="indexclass">Average Rating: {props.avgRating}</p>
       </Link>
     </div>
   )
}

export default WizardTile
