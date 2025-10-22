---
title: "Purkinje Effect"
date: 2025-10-22T03:33:54+08:00
tags: [ "color" ]
categories: [ "Others"  ]
summary: "short desc."
draft: true
---
{{< lead >}}
*Human eye sensitivity shifts significantly between bright light (daytime) and very low light (nightime) conditions.*
{{< /lead >}}

Do you know why **glow in dark** objects are predominantly *green* in color?

It is for a combination of reasons relating to the **phosphor materials** used and the **sensitivity of the human eye**.

Also, the dominance of green in glow-in-the-dark materials is largely due to these two wavelengths, which correspond to the peak sensitivity of the human eye in light and dark conditions, respectively.

## Glow-In-Dark

The materials that enable "glow-in-the-dark" (phosphorescence process) are called **phosphors**.
And the most common non-toxic phosphor was **zinc sulfide** mixed with a copper activator (ZnS:Cu), which naturally emits a ***green*** light.

Modern materials like **strontium aluminate** activated by rare earth elements are much brighter and last longer, and they also commonly produce ***green*** or ***aqua*** (blue-green) hues.

## The Purkinje Effect

The change in how human eyes perceive color brightness as light levels drop is a phenomenon called the **Purkinje effect** (or Purkinje shift).

 - **In Bright Light (Photopic Vision):** Human vision is dominated by **cone cells**, which perceive color and detail. The peak sensitivity is at *yellow-green* (~555nm).
 - **In Very Low Light (Scotopic Vision):** Human vision shifts to **rod cells**, which are much more sensitive to light but cannot perceive color. The peak sensitivity shifts toward the blue end of the spectrum, at *blue-green* (507 nm).

The primary factor is that the human eye is *most sensitive to green light* (specifically, yellow-green light around 555 nm) in well-lit conditions (photopic vision). 
In low-light or dark conditions (scotopic vision), human eyes are most sensitive to blue-green light around 507 nm. 

And manufacturers choose phosphors that emit light in this spectrum because it gives the **brightest apparent glow** to the user, maximizing the effect for the least amount of emitted light energy.

> The visibility of a color is defined by its wavelength, which determines how strongly it stimulates the light-sensing cells in the human eyes.

Yellow-Green (555 nm) - Photopic Peak
: This wavelength is where the **light-adapted human eye** (photopic vision, used in daylight or well-lit conditions) is most sensitive.

Blue-Green (507 nm) - Scotopic Peak
: This wavelength is where the dark-adapted human eye (scotopic vision, used in very low-light conditions) is most sensitive.


## Demonstration

Representing specific wavelengths of light with RGB/HEX codes is just an approximation.
As the human visual system processes a spectrum of light, and not just a single color code.

However, the Hex codes below are visually representative of the colors at those general points in visible spectrum.

### Hex Codes

The hex codes `#A8FF00` and `#00FF90` represents a *bright* ***chartreuse green*** and a *bright* ***cyan-green***, respectively.

> `#A8FF00` is primarily a mix of green and red, while `#00FF90` is a pure green with some blue. 

| Feature | `#A8FF00` | `#00FF90` |
| :------ | :-------- | :-------- |
| Primary Color | Green with yellow/red understones | Green with blue undertones | 
| RGB Value | (168,255,0) | (0,255,144) |
| CMYK Value | (0.34,0.00,1.00,0.00) | (1.00,0.00,0.44,0.00) |
| Hue | 80.5 degrees | 153.9 degrees |
| Saturation | 100% | 100% |
| Ligthness | 50% | 50% |
| Sample | {{< swatches "#A8FF00" >}} | {{< swatches "#00FF90" >}} |
| Significance | Peak for light-adapted vision | Peak for dark-adapted vision |

## Preserve Night Vision

Nonetheless, **red light** is commonly used to *preserve night vision* incstead of green.
Such as astronomers, sailors, pilots, and military personnel use red lights to read maps or instrument panels in the dark.

It's precisely because the rod cells that provide night vision are least sensitive to red light (long wavelengths).

 1. **Preserving Night Adaptation:** 
    - Exposure to bright light causes the rods to become temporarily desensitized ("bleached"), which takes time for your eyes to adapt to the dark. 
    - Since red light minimally stimulates the rods, using a dim red light allows your cones (used for high-acuity tasks like reading) to see the light source without significantly destroying the dark adaptation of your rods (which you need to see outside the cockpit or observatory).

 1. **Red Fades Away:** 
    - When you turn off a dim red light, your dark adaptation (scotopic vision) returns almost immediately, as the rod cells were never significantly affected. 
    - If you used a blue-green light, even a dim one, it would immediately ruin your night vision because it sits right at the rods' peak sensitivity.

## Colors' WaveLength 

In low light (twilight or darkness), your vision is dominated by the rod cells (scotopic vision), which are responsible for night vision but cannot detect color. 
The peak sensitivity of these rod cells is at 507nm, which is in the **blue-green** part of the spectrum.

> This phenomenon is known as the Purkinje Effect, where the eye's peak sensitivity shifts toward shorter (bluer) wavelengths as light levels decrease.

Here is the ranking of the four colors based on their visibility (or apparent brightness) in very low light:

| Rank | Color | Wavelength Range | Rationale | 
| :--- | :---- | :--------------- | :-------- | 
| 1st | Green / Blue-Green | 507 nm (peak) | Closest to the peak sensitivity of the dark-adapted rod cells. |
| 2nd | Blue | 450–495 nm (shortest) | Closer to the scotopic peak than yellow or red, making it relatively visible." |
| 3rd | Yellow | 570–590 nm (middle)| Further from the scotopic peak and closer to the photopic (daytime) peak. |
| 4th | Red | 620–750 nm (longest) | Least visible in very low light because the rod cells are highly insensitive to these long wavelengths. |

> In summary: In a dimly lit environment, blue and green appear brightest, while red and orange appear the darkest.

## Penetration Rate

The penetration rate (or depth) of light is **inversely related to its energy per photon** across the visible spectrum for many common media, such as water and human tissue.

In the visible light range, **longer wavelengths penetrate deeper** than shorter wavelengths.

Here is the ranking of the four colors based on their general penetration depth in biological tissue:

| Rank (Deepest to Shallowest) | Color | Wavelength Range (approx.) | Penetration Rationale |
| :--------------------------- | :---- | :------------------------- | :-------------------- |
| 1st | Red | 620–750 nm | Longest wavelength in the visible spectrum; experiences the least absorption and scattering in tissue. |
| 2nd | Yellow | 570–590 nm | Longer than green and blue, allowing it to penetrate deeper than the short-wavelength colors." |
| 3rd | Green | 495–570 nm | Absorbed more strongly by chromophores like hemoglobin and melanin than yellow or red. |
| 4th | Blue | 450–495 nm | Shortest wavelength; most easily scattered and absorbed by the upper layers of tissue (like the epidermis), resulting in the shallowest penetration." |

The exact penetration depth depends heavily on the medium.

In Human Tissue (Skin): Red light (and especially Near-Infrared (NIR) light, which is just beyond visible red) penetrates the deepest, reaching several millimeters up to a centimeter or more.
This is because there are fewer biological molecules (chromophores) in tissue that strongly absorb light in this long-wavelength region, often called the "therapeutic window. 
Blue light penetrates the least, often only reaching about 2$1\text{ mm}$ into the tissue.

In Clear Water (Ocean): The ranking reverses due to the dominant scattering and absorption characteristics of water molecules.
Blue light (shorter wavelength) penetrates the deepest (why deep ocean water looks blue).
Red light (longer wavelength) is absorbed the fastest near the surface. 

*This is why a red object appears black underwater at depth.*

## Police Sirens

The combination of red and blue lights for police sirens is based on a mix of **science, psychology, and tradition/regulation** to achieve *maximum visibility and a clear warning*.

Here are the key reasons:

1. Superior Visibility in All Conditions (The Science)
   - **Red Light for Daytime/Fog:** Red light has a longer wavelength and is less scattered by moisture and dust in the atmosphere. This means it can penetrate fog, haze, and dust better, making it more visible during the day and in poor weather conditions. Red has also been traditionally associated with "stop" or "danger."

   - **Blue Light for Nighttime:** Blue light has a shorter wavelength and stands out exceptionally well in the dark. At night, the human eye's rod cells (responsible for night vision) are more sensitive to the shorter-wavelength blue and green light (a phenomenon known as the Purkinje effect), making blue highly conspicuous.

   - **Contrast and Motion:** When red and blue lights are flashed alternately, the high contrast between the colors creates a strong visual "pop" that is very effective at grabbing a driver's attention and signaling a unique emergency situation.

1. Differentiation and Warning (The Psychology)
   - **The "Stop" Signal:** Red has been the universal color for "stop" and "danger" (e.g., stop signs, traffic lights, brake lights) for a long time, triggering an immediate alert response in the brain.

   - **Unique Identity:** Flashing red and blue together is a combination that is exclusive to law enforcement in many regions (though specific regulations vary by country/state). This distinct combination prevents confusion with:

     - Ambulances/Fire Trucks: Which often use a primary color of red (and sometimes white).

     - Tow Trucks/Utility Vehicles: Which typically use amber/yellow lights.

     - Standard Vehicles: Whose brake lights are all red. The addition of blue helps a driver immediately distinguish police lights from the red brake lights of regular traffic.

   - **Color Blindness:** Using both colors helps drivers who are colorblind. People with common forms of color blindness (red-green) who may struggle to see the red light often have no issue seeing the blue light, ensuring the emergency signal is received by more people.

In short, the combination is an **optimum signaling system** designed to be seen clearly by the human eye at any time of day or night, in different weather, and to be instantly recognized as a police vehicle requiring immediate yielding.

## Torch Light

This is to highlight the difference between an **emergency signal and a general-purpose light source**.

The choice of white or yellow (warm white) for torchlights (flashlights) is primarily about **visibility, color accuracy, and comfort**. 
They are designed to illuminate an area for practical purposes, not to warn distant traffic.

Here is a breakdown of why white and yellow are the dominant colors:

White light, particularly "cool white" (daylight white) with a slightly bluish tint, is the most common for several reasons:

   - **Maximum Perceived Brightness:** The human eye is most sensitive to light in the middle of the color spectrum (green/yellow-green). However, a bright, cool white light is perceived as the brightest and most intense by our eyes.

   - **Maximum Throw/Distance:** Cool white LEDs provide the highest contrast, which helps the beam travel farther and makes distant objects look sharper. This is why it's popular in tactical, search, and long-range flashlights.

   - **General Purpose:** White light is a broad spectrum light, meaning it allows you to see the true color of objects, which is essential for identifying objects, reading maps, or performing tasks.

"Yellow Light" in modern flashlights is usually referred to as Warm White light.
This light has a lower color temperature, similar to an old incandescent bulb, candlelight, or fire.

   - **Better Penetration in Fog/Rain:** Similar to the red light used by police, the longer wavelength of warm, yellowish light scatters less off water droplets. This makes it more effective for cutting through fog, rain, or dust, where bright white light would simply reflect back and create a blinding glare (the "white-out" effect).

   - **Reduced Eye Strain (Comfort):** Warm, yellow-tinted light is less harsh on the eyes, making it more comfortable for close-up tasks, reading, or long periods of use. It also interferes less with your natural night vision (though red is even better for preserving it).

   - **Better for Close-Up Detail:** Warm white lights often have a higher Color Rendering Index (CRI), which is critical for tasks where you need to see subtle differences in color, such as distinguishing wires, evaluating blood trails, or doing intricate work.


