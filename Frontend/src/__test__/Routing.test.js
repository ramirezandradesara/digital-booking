import Routing from '../../src/Routing/Routing';
import { render } from "@testing-library/react";
import React from "react";

let component = null;

beforeEach(() => {
    component = render(<Routing />)
});

test('Renderizado del routing', () => {
    expect(component.container).toBeInTheDocument();
});