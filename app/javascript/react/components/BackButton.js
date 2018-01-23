import React from 'react';
import { browserHistory } from 'react-router';

const BackButton = (props) => {

  return(
    <div>
      <button onClick={browserHistory.goBack}>Back</button>
    </div>
  )
}
export default BackButton;
