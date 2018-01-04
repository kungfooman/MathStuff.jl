using StaticArrays
const Vec3 = SVector{3,Float32}

function distanceSquared(a::Vec3, b::Vec3)::Float32
	c = b - a
	return (c[1] * c[1]) + (c[2] * c[2]) + (c[3] * c[3])
end

function distance(a::Vec3, b::Vec3)::Float32
	return sqrt(distanceSquared(a, b))
end

immutable LineSegment3
	origin::Vec3
	direction::Vec3
	LineSegment3(a::Vec3, b::Vec3) = new(a, b-a)
end

function closestPoint(this::LineSegment3, point::Vec3)::Vec3
	w = point - this.origin
	
	proj = dot(w, this.direction)

	if proj <= 0f0
		return this.origin
	else
		vsq = dot(this.direction, this.direction)
		if proj >= vsq
			return this.origin + this.direction
		else
			return this.origin + (proj/vsq) * this.direction
		end
	end
end

Vec3X(x)::Vec3 = Vec3(x, 0, 0)
Vec3Y(y)::Vec3 = Vec3(0, y, 0)
Vec3Z(z)::Vec3 = Vec3(0, 0, z)

if false
	ls = LineSegment3( pos(wp_a), pos(wp_b) )
	closest_point = closestPoint(ls, pos(player))
	pos!(go_cube, closest_point)
end


