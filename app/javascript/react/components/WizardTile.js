import React from 'react';
import { Link } from 'react-router'

const WizardTile = (props) => {

   return(
     <div>
       <Link to={`/wizards/${props.id}`}>
         <ul>
            <li>{props.name}</li>
            <li>{props.description}</li>
         </ul>
       </Link>
     </div>
   )
}

export default WizardTile
