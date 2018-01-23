import React from 'react'

const Wizard = (props) => {
   return(
     <div>
       <ul>
          <li>{props.name}</li>
          <li>{props.description}</li>
       </ul>
     </div>
   )
}

export default Wizard
