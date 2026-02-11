'use client'

import { useEffect, useRef } from 'react'

export default function AuthLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const canvasRef = useRef<HTMLCanvasElement>(null)

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return
    const ctx = canvas.getContext('2d')
    if (!ctx) return

    let animationId: number
    let width = (canvas.width = window.innerWidth)
    let height = (canvas.height = window.innerHeight)

    const handleResize = () => {
      width = canvas.width = window.innerWidth
      height = canvas.height = window.innerHeight
    }
    window.addEventListener('resize', handleResize)

    // Geometric shapes
    interface Shape {
      x: number
      y: number
      size: number
      rotation: number
      rotationSpeed: number
      speedX: number
      speedY: number
      opacity: number
      type: 'triangle' | 'hexagon' | 'square' | 'circle' | 'line'
      color: string
    }

    const colors = [
      'rgba(99, 102, 241,',   // indigo
      'rgba(139, 92, 246,',    // violet
      'rgba(59, 130, 246,',    // blue
      'rgba(6, 182, 212,',     // cyan
      'rgba(168, 85, 247,',    // purple
    ]

    const shapes: Shape[] = []
    const shapeCount = 25

    for (let i = 0; i < shapeCount; i++) {
      shapes.push({
        x: Math.random() * width,
        y: Math.random() * height,
        size: Math.random() * 40 + 15,
        rotation: Math.random() * Math.PI * 2,
        rotationSpeed: (Math.random() - 0.5) * 0.02,
        speedX: (Math.random() - 0.5) * 0.6,
        speedY: (Math.random() - 0.5) * 0.6,
        opacity: Math.random() * 0.15 + 0.05,
        type: (['triangle', 'hexagon', 'square', 'circle', 'line'] as const)[
          Math.floor(Math.random() * 5)
        ],
        color: colors[Math.floor(Math.random() * colors.length)],
      })
    }

    // Connection lines between nearby shapes
    function drawConnections() {
      for (let i = 0; i < shapes.length; i++) {
        for (let j = i + 1; j < shapes.length; j++) {
          const dx = shapes[i].x - shapes[j].x
          const dy = shapes[i].y - shapes[j].y
          const dist = Math.sqrt(dx * dx + dy * dy)
          if (dist < 200) {
            const opacity = (1 - dist / 200) * 0.08
            ctx!.beginPath()
            ctx!.moveTo(shapes[i].x, shapes[i].y)
            ctx!.lineTo(shapes[j].x, shapes[j].y)
            ctx!.strokeStyle = `rgba(99, 102, 241, ${opacity})`
            ctx!.lineWidth = 0.5
            ctx!.stroke()
          }
        }
      }
    }

    function drawShape(shape: Shape) {
      ctx!.save()
      ctx!.translate(shape.x, shape.y)
      ctx!.rotate(shape.rotation)
      ctx!.strokeStyle = `${shape.color} ${shape.opacity})`
      ctx!.lineWidth = 1.5
      ctx!.beginPath()

      switch (shape.type) {
        case 'triangle':
          for (let i = 0; i < 3; i++) {
            const angle = (i * 2 * Math.PI) / 3 - Math.PI / 2
            const x = Math.cos(angle) * shape.size
            const y = Math.sin(angle) * shape.size
            if (i === 0) ctx!.moveTo(x, y)
            else ctx!.lineTo(x, y)
          }
          ctx!.closePath()
          break

        case 'hexagon':
          for (let i = 0; i < 6; i++) {
            const angle = (i * 2 * Math.PI) / 6
            const x = Math.cos(angle) * shape.size
            const y = Math.sin(angle) * shape.size
            if (i === 0) ctx!.moveTo(x, y)
            else ctx!.lineTo(x, y)
          }
          ctx!.closePath()
          break

        case 'square':
          ctx!.rect(
            -shape.size / 2,
            -shape.size / 2,
            shape.size,
            shape.size
          )
          break

        case 'circle':
          ctx!.arc(0, 0, shape.size / 2, 0, Math.PI * 2)
          break

        case 'line':
          ctx!.moveTo(-shape.size, 0)
          ctx!.lineTo(shape.size, 0)
          break
      }

      ctx!.stroke()

      // Subtle fill for some shapes
      if (shape.type !== 'line') {
        ctx!.fillStyle = `${shape.color} ${shape.opacity * 0.3})`
        ctx!.fill()
      }

      ctx!.restore()
    }

    function animate() {
      ctx!.clearRect(0, 0, width, height)

      // Dark gradient background
      const gradient = ctx!.createRadialGradient(
        width / 2, height / 2, 0,
        width / 2, height / 2, Math.max(width, height) * 0.7
      )
      gradient.addColorStop(0, '#0f0f1a')
      gradient.addColorStop(0.5, '#070710')
      gradient.addColorStop(1, '#000005')
      ctx!.fillStyle = gradient
      ctx!.fillRect(0, 0, width, height)

      drawConnections()

      for (const shape of shapes) {
        shape.x += shape.speedX
        shape.y += shape.speedY
        shape.rotation += shape.rotationSpeed

        // Wrap around edges
        if (shape.x < -shape.size) shape.x = width + shape.size
        if (shape.x > width + shape.size) shape.x = -shape.size
        if (shape.y < -shape.size) shape.y = height + shape.size
        if (shape.y > height + shape.size) shape.y = -shape.size

        drawShape(shape)
      }

      // Subtle grid overlay
      ctx!.strokeStyle = 'rgba(99, 102, 241, 0.03)'
      ctx!.lineWidth = 0.5
      const gridSize = 60
      for (let x = 0; x < width; x += gridSize) {
        ctx!.beginPath()
        ctx!.moveTo(x, 0)
        ctx!.lineTo(x, height)
        ctx!.stroke()
      }
      for (let y = 0; y < height; y += gridSize) {
        ctx!.beginPath()
        ctx!.moveTo(0, y)
        ctx!.lineTo(width, y)
        ctx!.stroke()
      }

      animationId = requestAnimationFrame(animate)
    }

    animate()

    return () => {
      cancelAnimationFrame(animationId)
      window.removeEventListener('resize', handleResize)
    }
  }, [])

  return (
    <div className="relative flex min-h-screen items-center justify-center overflow-hidden px-4">
      <canvas
        ref={canvasRef}
        className="pointer-events-none fixed inset-0 h-full w-full"
        style={{ zIndex: 0 }}
      />
      <div className="relative z-10 w-full max-w-md">{children}</div>
    </div>
  )
}
