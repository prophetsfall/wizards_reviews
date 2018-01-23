import WizardsContainer from '../../app/javascript/react/containers/WizardsContainer'
import Wizard from '../../app/javascript/react/components/WizardComponent'

import { shallow, mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';
import 'jasmine-ajax';

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

describe('WizardsContainer', ()=>{
  let wrapper
  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <WizardsContainer/>
    )
    wrapper.setState({
      wizards: [
        {name: 'Ian', description: 'A description'},
        {name: 'James', description: 'A description'}
      ]
    })
  });
  // let wrapper
  // beforeEach(()=>{
  //
  //   wrapper.setState({
  //     name: 'Ian'
  //     wizards: [
  //       {name: 'Ian', description: 'A description'},
  //       {name: 'James', description: 'A description'}
  //     ]
  //   })
  // })
  it('Should render Wizard components with the given state', ()=>{

    expect(wrapper.find(Wizard).at(0).props()).toEqual({name: 'Ian', description: "A description"})
    expect(wrapper.find(Wizard).at(1).props().name).toEqual('James')
    // .toBePresent();
  })
})
