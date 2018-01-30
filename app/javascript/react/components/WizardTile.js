import React from 'react';
import { Link } from 'react-router'

const WizardTile = (props) => {
   return(
     <div>
       <Link to={`/wizards/${props.id}`}>
         <ul>
            <li>{props.name}</li>
         </ul>
         <p>Average Rating: {props.avgRating}</p>
       </Link>
        <img src={`${props.imgUrl}`} alt='wizardPic'/>
     </div>
   )
}

export default WizardTile
