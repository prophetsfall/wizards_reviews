import React from 'react';
import { Link } from 'react-router'

const WizardTile = (props) => {
   return(
     <div>
       <img src={`${props.imgUrl}`} alt='wizardPic'/>

       <Link to={`/wizards/${props.id}`}>
         <ul>
            <li>{props.name}</li>
         </ul>
       </Link>
     </div>
   )
}

export default WizardTile
