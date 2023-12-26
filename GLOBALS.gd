extends Node

const angle 	= -60.0
const scale 	= Vector3(1, 1/cos(deg_to_rad(angle)), -1/sin(deg_to_rad(angle)))
const camsize 	= 22.5

const px_m16 	= 16
const px_m32 	= 32
const m_px16 	= 1.0/px_m16
const m_px32 	= 1.0/px_m32

const pxHeight 	= 360
const pxWidth 	= 640
const mHeight 	= 22.5
const mWidth 	= 40.0

func m_to_px16(m_val: float):
	return m_val * px_m16

func m_to_px32(m_val: float):
	return m_val * px_m32

func px_to_m16(px_val: int):
	return px_val * m_px16

func px_to_m32(px_val: int):
	return px_val * m_px32
