import React from 'react';
import { Link } from 'react-router';
import BackButton from './BackButton';

const NavBar = (props) => {

  return(
    <div>
      <BackButton />
      <Link to='/'>Home</Link>
      { props.children }
    </div>
  )
}
export default NavBar;