import WizardsContainer from '../../app/javascript/react/containers/WizardsContainer'
import Wizard from '../../app/javascript/react/components/WizardComponent'

import { shallow, mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import 'jasmine-ajax';

import fetch from 'isomorphic-fetch'

Object.assign(global, {
  jasmineEnzyme,
  mount,
  React,
  shallow,
});



// function to require all modules for a given context
let requireAll = requireContext => {
  requireContext.keys().forEach(requireContext);
};

describe('WizardComponent', ()=>{
  let wrapper
  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <Wizard/>
    )
  });
  

})