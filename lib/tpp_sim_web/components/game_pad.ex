defmodule TppSimWeb.Components.Gamepad do
  use Phoenix.Component

  def a_button(assigns) do
    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 100 100"
      xmlns:bx="https://boxy-svg.com"
      preserveAspectRatio="xMidYMid slice"
      width="100px"
      height="100px"
    >
      <ellipse
        style="fill: rgb(216, 216, 216); stroke: rgb(156, 156, 156);"
        cx="50"
        cy="50"
        rx="30"
        ry="30"
      />
      <text
        style="fill: rgb(156, 156, 156); font-family: Arial, sans-serif; font-size: 25px; stroke-linejoin: bevel; white-space: pre;"
        x="0"
        y="60"
      >
        A
      </text>
    </svg>
    """
  end

  def b_button(assigns) do
    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 100 100"
      xmlns:bx="https://boxy-svg.com"
      preserveAspectRatio="xMidYMid slice"
      width="100px"
      height="100px"
    >
      <ellipse
        style="fill: rgb(216, 216, 216); stroke: rgb(156, 156, 156);"
        cx="50"
        cy="50"
        rx="30"
        ry="30"
      />
      <text
        style="fill: rgb(156, 156, 156); font-family: Arial, sans-serif; font-size: 25px; stroke-linejoin: bevel; white-space: pre;"
        x="0"
        y="60"
        id="object-0"
      >
        B
      </text>
    </svg>
    """
  end
end
