import WizardTile from '../../app/javascript/react/components/WizardTile'

import { shallow, mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';


Object.assign(global, {
  jasmineEnzyme,
  mount,
  React,
  shallow,
});

let requireAll = requireContext => {
  requireContext.keys().forEach(requireContext);
};

describe('WizardTile', ()=>{
  let wrapper
  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <WizardTile />
    )
    wrapper.setProps({name: 'Ian', avgRating: '81'})
  });

  it('Should return html with the data from props', () => {
    console.log(wrapper.find('p').first());
    expect(wrapper.find('li').first()).toHaveText('Ian')
    expect(wrapper.find('p').first()).toHaveText('Average Rating: 81')
  })
})
